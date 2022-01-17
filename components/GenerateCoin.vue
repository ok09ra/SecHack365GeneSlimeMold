<template>
    <div>
        <h2>alchemy</h2>
        <form>
            <label>
                send to address
                <input type="text" v-model="send_to_address">
            </label>
            <br>
            <label>
                Value
                <input type="number" v-model="send_value">
            </label>
            <br>
            <button @click="sendValueToAddress">send</button>
        </form>
    </div>
</template>

<script>
export default{
    data(){return{
        send_to_address: "",
        send_value: 0,
    }},
    methods:{
        async sendValueToAddress(e){  
            await this.$contract.methods.supervisorTransfer(this.send_to_address, this.send_value).send({from: this.$store.state.user_data.my_address});
        },
    }
}
</script>