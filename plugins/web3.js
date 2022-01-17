import Web3 from "web3"
import artifacts from "~~/build/contracts/GeneSlimeMoldAlpha.json"// コントラクトのコンパイル後の設定ファイルの読み込み
import mapState from "vuex"

export default async function(context, inject) {
    let web3
    // MetaMask ver0.5以降のチェック処理 ref https://www.techpit.jp/courses/36/curriculums/37/sections/306/parts/1020
    if (window.ethereum) {
        // web3のインスタンスを作成する
        let instance = new Web3(window.ethereum);
        try {
            // MetaMaskのプロバイダの使用
            web3 = instance;
            // アカウントへのアクセスを要求する
            try {
                const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
                console.log(accounts)
                context.store.dispatch("user_data/get_my_address", accounts[0]);
              } catch (error) {
                console.log(error)
              }

        } catch (error) {
            // アクセスを拒否された時のアラートを表示
            alert('Please allow access for the app to work');
        }
    }

    let networkId = await web3.eth.net.getId()// チェーンのネットワークIDを取得
    let contract = new web3.eth.Contract( //コントラクトのインスタンスの初期化。設定ファイルと、アドレスが必要
        artifacts.abi, // コントラクトのコンパイル後の設定ファイル
        artifacts.networks[networkId].address // ネットワークIDごとに保存されているコントラクトのアドレスを読み込む
    )

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