<template>
<div>
    <h2>My Made Event</h2>
    <table class="geneLists">
        <thead>
            <tr>
                <th>description</th>
                <th>To_address</th>
                <th>is_accepted</th>
                <th>is_blocked</th>
                <th>is_executed</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(my_made_use_event, index) in this.$store.state.user_data.my_made_use_event_data" :key="index">
                    <td>{{my_made_use_event.description}}</td>
                    <td>{{my_made_use_event.offer_to_address}}</td>
                    <td>{{my_made_use_event.is_approved}}</td>
                    <td>{{my_made_use_event.is_blocked}}</td>
                    <td>{{my_made_use_event.is_executed}}</td>
                    <td><button @click="executeUseEvent(my_made_use_event.id)">execute</button></td>
            </tr>
        </tbody>
    </table>
</div>
</template>

<script>
    export default {     
        Data() {
        },
        methods:{
            executeUseEvent: async function(gene_data_id){
                let my_account = await this.$contract.methods.request_my_account_address().call();
                await this.$contract.methods.execute_use_event(gene_data_id).send({from: my_account});
            }
        }
    }
</script>