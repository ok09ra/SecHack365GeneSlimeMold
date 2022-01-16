<template>
    <div>
        <h2>Submit Gene Data</h2>
        <form id="submit_Gene_data_form">
            <label>
                Gene Holder Address
                <input type="text" v-model="mine_gene_form_gene_holder_address">
            </label>
            <br>
            <label>
                Gene URL
                <input type="text" v-model="mine_gene_form_gene_url">
            </label>
            <br>
            <label>
                description
                <textarea type="text" v-model="mine_gene_form_description"></textarea>
            </label>
            <br>
            <button @click="submit_gene_data">submit</button>
        </form>
    </div>

</template>

<script>
export default{
    data(){return{
        mine_gene_form_gene_holder_address: "",
        mine_gene_form_gene_url: "",
        mine_gene_form_description: "",
    }},
    methods:{
        async submit_gene_data(e){
            let my_account = await this.$contract.methods.request_my_account_address().call();
            await this.$contract.methods.register_mining_gene(this.mine_gene_form_gene_holder_address, this.mine_gene_form_gene_url, this.mine_gene_form_description).send({from: my_account})
        }
    }
}
</script>