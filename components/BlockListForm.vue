<template>
    <div>
        <h2>Block List</h2>
        <form>
            <label>
                block user address
                <input type="text" v-model="block_user_address">
            </label>
            <br>
            <button @click="addBlockList">block</button>
            <button @click="forgiveBlockUser">forgive</button>
        </form>
    </div>
</template>

<script>
export default{
    data(){return{
        block_user_address: "",
    }},
    methods:{
        async addBlockList(e){
            let my_account = await this.$contract.methods.request_my_account_address().call();
            await this.$contract.methods.add_block_list(this.block_user_address).send({from: my_account});
        },
        async forgiveBlockUser(e){
            let my_account = await this.$contract.methods.request_my_account_address().call();
            await this.$contract.methods.remove_block_list(this.block_user_address).send({from: my_account});
        }
    }
}
</script>