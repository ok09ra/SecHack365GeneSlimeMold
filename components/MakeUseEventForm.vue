<template>
    <div>
        <h2>Make Use Event</h2>
        <form>
            <label>
                Offering Gene Holder Address
                <input type="text" v-model="make_use_event_form_gene_holder_address">
            </label>
            <br>
            <label>
                Description
                <textarea type="number" v-model="make_use_event_form_gene_data_id"></textarea>
            </label>
            <label>
                Description
                <textarea type="text" v-model="make_use_event_form_description"></textarea>
            </label>
            <br>
            <label>
                Payment
                <input type="number" v-model="make_use_event_form_payment">
            </label>
            <br>
            <button @click="make_use_event">submit</button>
        </form>
    </div>
</template>

<script>
export default{
    data(){return{
        make_use_event_form_gene_holder_address: "",
        make_use_event_form_gene_data_id: "",
        make_use_event_form_description: "",
        make_use_event_form_payment: "",
    }},
    methods:{
        async make_use_event(e){
            await this.$contract.methods.generate_use_event(this.make_use_event_form_description, this.make_use_event_form_gene_holder_address, this.make_use_event_form_gene_data_id, this.make_use_event_form_payment).send({from: this.$store.state.user_data.my_address});
        }
    }
}
</script>