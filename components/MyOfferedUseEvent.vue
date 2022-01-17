<template>
    <div>
        <h2>Offered Use Event</h2>
        <table class="geneLists">
            <thead>
                <tr>
                    <th>id</th>
                    <th>description</th>
                    <th>To_address</th>
                    <th>is_accepted</th>
                    <th>is_blocked</th>
                    <th>is_executed</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(my_use_event, index) in this.$store.state.user_data.my_use_event_data" :key="index">
                    <td>{{my_use_event.id}}</td>
                    <td>{{my_use_event.description}}</td>
                    <td>{{my_use_event.offer_to_address}}</td>
                    <td>{{my_use_event.is_approved}}</td>
                    <td>{{my_use_event.is_blocked}}</td>
                    <td>{{my_use_event.is_executed}}</td>
                    <td><button @click="acceptUseEvent(my_use_event.id)">accept</button></td>
                    <td><button @click="blockUseEvent(my_use_event.id)">block</button></td>
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
            acceptUseEvent: async function(gene_data_id){
                await this.$contract.methods.approve_use_event_offer(gene_data_id).send({from: this.$store.state.user_data.my_address});
            },
            blockUseEvent: async function(gene_data_id){
                await this.$contract.methods.block_use_event_offer(gene_data_id).send({from: this.$store.state.user_data.my_address});
            }
        }
    }
</script>