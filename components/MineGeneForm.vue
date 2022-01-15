<template>
    <div>
        <h2>Submit Gene Data</h2>
        <form>
            <label>
                Gene Holder Address
                <input type="text" v-model="gene_data_submit.gene_holder_address">
            </label>
            <br>
            <label>
                Gene URL
                <input type="url" v-model="gene_data_submit.gene_url">
            </label>
            <br>
            <label>
                description
                <input type="text" v-model="gene_data_submit.description">
            </label>
            <br>
            <button id="btn">submit</button>
        </form>
    </div>

</template>

<script>

</script>