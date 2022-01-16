<template>
    <div>
        <h2>Offered Use Event</h2>
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
                <tr v-for="(my_use_event, index) in this.$store.state.my_use_event_data" :key="index">
                    <td>{{my_use_event.description}}</td>
                    <td>{{my_use_event.offer_to_address}}</td>
                    <td>{{my_use_event.is_approved}}</td>
                    <td>{{my_use_event.is_blocked}}</td>
                    <td>{{my_use_event.is_executed}}</td>
                    <td><button>execute</button></td>
                </tr>
            </tbody>
        </table>
    </div>

</template>

<script>
    export default {
        
        Data() {
            my_use_event_datas = []
        },
        methods:{
            getMyUseEvent: async function(e){
                this.my_use_event_datas = await this.$contract.methods.request_own_use_event_list().call();
            },
            acceptGeneData: async function(gene_data_id){
                
            }
        }
    }
</script>