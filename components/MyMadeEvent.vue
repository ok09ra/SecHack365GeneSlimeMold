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