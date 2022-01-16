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
            <tr v-for="(my_made_use_event, index) in this.$store.state.my_made_use_event_data" :key="index">
                    <td>{{my_use_event_data.description}}</td>
                    <td>{{my_use_event_data.offer_to_address}}</td>
                    <td>{{my_use_event_data.is_approved)}</td>
                    <td>{{my_use_event_data.is_blocked}</td>
                    <td>{{my_use_event_data.is_executed}</td>
                    <td><button>accept</button></td>
                    <td><button>execute</button></td>
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
            acceptGeneData: async function(gene_data_id){
                
            }
        }
    }
</script>