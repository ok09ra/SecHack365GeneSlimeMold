<template>
    <div>
        <h2>My Mined Gene</h2>
        <table class="geneLists">
            <thead>
                <tr>
                    <th>description</th>
                    <th>To_address</th>
                    <th>gene_url</th>
                    <th>is_accepted</th>
                    <th>is_blocked</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(my_mined_gene, index) in this.$store.state.my_mined_gene_data" :key="index">
                    <td>{{my_mined_gene.description}}</td>
                    <td>{{my_mined_gene.miner_address}}</td>
                    <td>{{my_mined_gene.gene_url}</td>
                    <td>{{my_mined_gene.is_accepted}</td>
                    <td>{{my_mined_gene.is_blocked}</td>
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