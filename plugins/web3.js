import Web3 from "web3"
import artifacts from "~~/build/contracts/GeneSlimeMoldAlpha.json"// コントラクトのコンパイル後の設定ファイルの読み込み
import mapState from "vuex"

export default async function(context, inject) {
    let web3
    // MetaMask ver0.5以降のチェック処理
    if (typeof window.ethereum) {
        // web3のインスタンスを作成する
        let instance = new Web3(window.ethereum);
        try {
            // アカウントへのアクセスを要求する
            window.ethereum.enable();
            // MetaMaskのプロバイダの使用
            web3 = instance;
        } catch (error) {
            // アクセスを拒否された時のアラートを表示
            alert('Please allow access for the app to work');
        }
    // MetaMask ver0.5以前のチェック処理
    } else if (window.web3) {
        // MetaMaskのプロバイダの使用
        web3 = new Web3(window.web3.currentProvider);
    } else {
        console.log('Non-Ethereum browser detected. You should consider trying MetaMask!');
    }

    let networkId = await web3.eth.net.getId()// チェーンのネットワークIDを取得
    let contract = new web3.eth.Contract( //コントラクトのインスタンスの初期化。設定ファイルと、アドレスが必要
        artifacts.abi, // コントラクトのコンパイル後の設定ファイル
        artifacts.networks[networkId].address // ネットワークIDごとに保存されているコントラクトのアドレスを読み込む
    )

    web3.eth.getAccounts((err, res) => {
        console.log(res[0]);
        context.store.dispatch("user_data/get_my_address", res[0]);
    });

    //console.log("my account address: " + context.store.state.user_data.my_address);

    let my_gene_data = await contract.methods.request_own_gene_mining_data_list().call({from: context.store.state.user_data.my_address});
    context.store.dispatch("user_data/get_my_gene_data", my_gene_data);
    //console.log("my gene data: " + context.store.state.user_data.my_gene_data);

    let my_mined_gene_data = await contract.methods.request_own_mined_gene_mining_data_list().call({from: context.store.state.user_data.my_address});
    context.store.dispatch("user_data/get_my_mined_gene_data", my_mined_gene_data);
    //console.log("my mined gene data: " + context.store.state.user_data.my_mined_gene_data);

    let my_use_event_data = await contract.methods.request_own_use_event_list().call({from: context.store.state.user_data.my_address});
    context.store.dispatch("user_data/get_my_use_event_data", my_use_event_data);
    //console.log("my use event data: " + context.store.state.user_data.my_use_event_data);

    let my_made_use_event_data = await contract.methods.request_own_made_use_event_list().call({from: context.store.state.user_data.my_address});
    context.store.dispatch("user_data/get_my_made_use_event_data", my_made_use_event_data);
    //console.log("my made use event data: " + context.store.state.user_data.my_made_use_event_data);

    inject('web3',web3)
    inject('contract',contract) // インスタンスを生やす
}