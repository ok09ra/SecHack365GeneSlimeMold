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
            
            await this.$contract.methods.add_block_list(this.block_user_address).send({from: this.$store.state.user_data.my_address});
        },
        async forgiveBlockUser(e){
            await this.$contract.methods.remove_block_list(this.block_user_address).send({from: this.$store.state.user_data.my_address});
        }
    }
}
</script>