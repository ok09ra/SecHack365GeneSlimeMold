<template>
    <div>
        <h2>My Gene Data</h2>
        <table class="geneLists">
            <thead>
                <tr>
                    <th>description</th>
                    <th>Miner_address</th>
                    <th>gene_url</th>
                    <th>is_accepted</th>
                    <th>is_blocked</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(my_gene_data, index) in this.$store.state.user_data.my_gene_data" :key="index">
                    <td>{{my_gene_data.description}}</td>
                    <td>{{my_gene_data.miner_address}}</td>
                    <td>{{my_gene_data.gene_url}}</td>
                    <td>{{my_gene_data.is_accepted}}</td>
                    <td>{{my_gene_data.is_blocked}}</td>
                    <td><button>accept</button></td>
                    <td><button>block</button></td>
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