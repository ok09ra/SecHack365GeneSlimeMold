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
                    <td>{{my_gene_data.url}}</td>
                    <td>{{my_gene_data.is_accepted_by_holder}}</td>
                    <td>{{my_gene_data.is_blocked_by_holder}}</td>
                    <td><button @click="acceptGeneData(my_gene_data.id)">accept</button></td>
                    <td><button @click="blockGeneData(my_gene_data.id)">block</button></td>
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
                await this.$contract.methods.accept_mining_gene(gene_data_id).send({from: this.$tore.state.user_data.my_address});
            },
            blockGeneData: async function(gene_data_id){
                await this.$contract.methods.blocked_mining_gene(gene_data_id).send({from: this.$tore.state.user_data.my_address});
            }
        }
    }
</script>