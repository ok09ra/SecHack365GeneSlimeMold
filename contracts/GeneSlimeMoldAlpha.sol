pragma solidity ^0.8.4;

contract GeneSlimeMoldAlpha{
    //全てのユーザーが持つユーザー情報
    struct GeneHolder{
        uint[] gene_mining_data_id_list;
        uint[] use_event_id_list;
        mapping(address => bool)block_address_list;
    }

    //限られたユーザーが持つ遺伝子を解析してブロックチェーン上に登録できる権限の情報
    struct GeneMiner{
        uint[] mined_gene_mining_data_id_list;
        bool is_available;
    }

    //限られたユーザーが持つ遺伝子を使用するイベントを発行できる権限の情報
    struct UseEventMaker{
        uint[] use_event_id_list;
        bool is_available;
    }

    //発行するイベントの情報
    struct UseEvent{
        uint id;
        address event_owner_address;
        string description;
        address payable offer_to_address;
        uint pay_amount;
        bool is_approved;
        bool is_blocked;
        bool is_executed;
    }
    
    //解析データを取得
    struct GeneMiningData{
        uint id;
        string url;
        string description;
        address gene_holder_address;
        address miner_address;
        bool is_accepted_by_holder;
        bool is_blocked_by_holder;
    }

    //通貨情報
    string public coin_name = "GeneCoin";
    string public symbol = "GC";

    mapping(address => uint) public balances; //各アドレスの保有通貨
    mapping(address => GeneHolder) private gene_holder_list; //ユーザーと遺伝子保持情報を紐づけ
    mapping(address => GeneMiner) private gene_miner_list; //ユーザーと遺伝子マイニング情報を紐づけ
    mapping(address => UseEventMaker) private use_event_maker_list; //ユーザーと遺伝子使用イベントを紐づけ

    GeneMiningData[] public gene_mining_data_list; //解析結果のデータのリスト
    UseEvent[] public use_event_list; //use eventのリスト

    address public supervisor; //コントラクトのオーナー

    constructor() public payable {
        supervisor = msg.sender; //コントラクトがデプロイされたときのオーナーをスーパーバイザーとする。
    }

/*アカウント定義　gene holder*/
    //ブロックリストに人を追加する。
    function add_block_list(address block_address) public{
        gene_holder_list[msg.sender].block_address_list[block_address] = true;
    }

    function remove_block_list(address block_address) public{
        gene_holder_list[msg.sender].block_address_list[block_address] = false;
    }

/*アカウント定義　gene miner*/
    function generate_gene_miner(address miner_address) public {
        require(supervisor == msg.sender);//ひとまずはスーパーバイザーだけが遺伝子解析事業者を操作できる様にしておく。今後は多数決で決められればいいと思っている。
        gene_miner_list[miner_address].is_available = true;
    }

    function invalidate_gene_miner(address miner_address) public {
        require(supervisor == msg.sender);//ひとまずはスーパーバイザーだけが遺伝子解析事業者を操作できる様にしておく。今後は多数決で決められればいいと思っている。
        gene_miner_list[miner_address].is_available = false; 
    }

/*アカウント定義 use event maker */
    function generate_use_event_maker(address use_event_maker_address) public {
        require(supervisor == msg.sender);//ひとまずはスーパーバイザーだけが遺伝子解析事業者を操作できる様にしておく。今後は多数決で決められればいいと思っている。
        use_event_maker_list[use_event_maker_address].is_available = true;
    }

    function invalidate_use_event_maker(address use_event_maker_address) public {
        require(supervisor == msg.sender);//ひとまずはスーパーバイザーだけが遺伝子解析事業者を操作できる様にしておく。今後は多数決で決められればいいと思っている。
        use_event_maker_list[use_event_maker_address].is_available = false; 
    }

/*遺伝子使用イベント定義関連 */
    //use event maker がuse event を発行する。
    function generate_use_event(string memory description, address payable offer_to_address, uint payment) public {
        //require(use_event_maker_list[msg.sender].is_available);//実行者がevent makerであるかを確認
        require(gene_holder_list[offer_to_address].block_address_list[msg.sender] == false);//ブロックリストに含まれていないか
        uint id = use_event_list.length;
        
        use_event_list.push(UseEvent(id, msg.sender, description, offer_to_address, payment, false, false, false)); // use_event_listに定義したuse eventを入力して、その配列の番号をidとして保持
        use_event_maker_list[msg.sender].use_event_id_list.push(id); //自分のuse_event_listにidを加える。

        gene_holder_list[offer_to_address].use_event_id_list.push(id);//オファーするgene holderにidを送る。
    }
    
    //use eventを承認する。
    function approve_use_event_offer(uint use_event_id) public{
        require(use_event_list[use_event_id].offer_to_address == msg.sender);
        use_event_list[use_event_id].is_approved = true;
        use_event_list[use_event_id].is_blocked = false;
    }

    //use eventを棄却する。
    function block_use_event_offer(uint use_event_id) public{
        require(use_event_list[use_event_id].offer_to_address == msg.sender);
        use_event_list[use_event_id].is_blocked = true;
        use_event_list[use_event_id].is_approved = false;
    }

/*通貨関連*/
    //アドレスの残高を返す
    function balanceOf(address _owner) public view returns (uint) {
        return (balances[_owner]);
    }
    //msg.senderがアカウントに指定量のトークンを送金する。
    function transfer(address _to, uint256 _value) public {
        require(_value <= balances[msg.sender]);

        balances[msg.sender] -= _value;
        balances[_to] += _value;
    }
    
    //SuperVisorがアカウントに指定量のトークンを発行する。
    function supervisorTransfer(address _to, uint256 _value) public{
        require(supervisor == msg.sender);
        balances[_to] += _value;


    }
/*利用実行と金銭やり取り関連*/

    //送金するための関数
    function balance_to(address payable reciever_address, uint pay_amount) public payable{
        reciever_address.transfer(pay_amount);
    }

    //use eventを実行する。
    function execute_use_event(uint use_event_id)public{
        require(use_event_list[use_event_id].event_owner_address == msg.sender);
        require(use_event_list[use_event_id].is_executed == false);        
        require(use_event_list[use_event_id].is_approved);
        //require(use_event_list[use_event_id].pay_amount <= address(this).balance);
        //balance_to(use_event_list[use_event_id].offer_to_address, use_event_list[use_event_id].pay_amount);
        use_event_list[use_event_id].is_executed = true;
    }

/*遺伝情報の定義情報*/
    //解析情報を追加する
    function register_mining_gene(address gene_holder_address, string memory gene_url, string memory description) public {
        //require(gene_miner_list[msg.sender].is_available);
        require(gene_holder_list[gene_holder_address].block_address_list[msg.sender] == false);//ブロックリストに含まれていないか
        uint id = gene_mining_data_list.length;

        gene_mining_data_list.push(GeneMiningData(id, gene_url, description, gene_holder_address, msg.sender, false, false));
        gene_holder_list[gene_holder_address].gene_mining_data_id_list.push(id);
        gene_miner_list[msg.sender].mined_gene_mining_data_id_list.push(id);
    }
    
    //本人がその解析情報を承認する。
    function accept_mining_gene(uint gene_mining_data_id) public {
        require(gene_mining_data_list[gene_mining_data_id].gene_holder_address == msg.sender);
        gene_mining_data_list[gene_mining_data_id].is_blocked_by_holder = false;
        gene_mining_data_list[gene_mining_data_id].is_accepted_by_holder = true;
        
    }

    //本人がその解析情報を棄却する。
    function blocked_mining_gene(uint gene_mining_data_id) public {
        require(gene_mining_data_list[gene_mining_data_id].gene_holder_address == msg.sender);
        gene_mining_data_list[gene_mining_data_id].is_accepted_by_holder = false;
        gene_mining_data_list[gene_mining_data_id].is_blocked_by_holder = true;
    }

    
/*情報表示関連*/
    //自分のアドレスを参照する。
    function request_my_account_address() public view returns(address){
        return msg.sender;
    }

    //自分の遺伝子解析情報を取得する。
    function request_own_gene_mining_data_list() external view returns(GeneMiningData[] memory){
        uint array_length = gene_holder_list[msg.sender].gene_mining_data_id_list.length;  
        GeneMiningData[] memory own_gene_mining_data_list = new GeneMiningData[](array_length);

        for(uint i = 0; i < array_length; i++){
            own_gene_mining_data_list[i] = gene_mining_data_list[gene_holder_list[msg.sender].gene_mining_data_id_list[i]];
        }

        return own_gene_mining_data_list;
    }

    //自分あてのuse eventを取得する。
    function request_own_use_event_list() external view returns(UseEvent[] memory){
        uint array_length = gene_holder_list[msg.sender].use_event_id_list.length;
        UseEvent[] memory own_use_event_list = new UseEvent[](array_length);
        
        for(uint i = 0; i < array_length; i++){
            own_use_event_list[i] = use_event_list[gene_holder_list[msg.sender].use_event_id_list[i]];
        }

        return own_use_event_list;
    }

    //自分が解析したデータの一覧を取得する。
    function request_own_mined_gene_mining_data_list() external view returns(GeneMiningData[] memory){
        uint array_length = gene_miner_list[msg.sender].mined_gene_mining_data_id_list.length;
        GeneMiningData[] memory own_mined_gene_mining_data_list = new GeneMiningData[](array_length);
        
        for(uint i = 0; i < array_length; i++){
            own_mined_gene_mining_data_list[i] = gene_mining_data_list[gene_miner_list[msg.sender].mined_gene_mining_data_id_list[i]];
        }

        return own_mined_gene_mining_data_list;
    }

    //自分が発行したuse eventを取得する。
    function request_own_made_use_event_list() external view returns(UseEvent[] memory){
        uint array_length = use_event_maker_list[msg.sender].use_event_id_list.length;
        UseEvent[] memory own_use_event_list = new UseEvent[](array_length);

        for(uint i = 0; i < array_length; i++){
            own_use_event_list[i] = use_event_list[use_event_maker_list[msg.sender].use_event_id_list[i]];
        }

        return own_use_event_list;
    }

}