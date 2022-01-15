<template>
    <dev id="Head">
        <h1 id="ProjectTitle">GENE SLIME MOLD</h1>
        <p id="UserAddress">ADDRESS</p>
        <li><nuxt-link to="/" >Top page</nuxt-link></li>
        <li><nuxt-link to="/holder" >Gene Holder Page</nuxt-link></li>
        <li><nuxt-link to="/usereventmaker" >Use Event Maker Page</nuxt-link></li>
        <li><nuxt-link to="/miner" >Gene Miner Page</nuxt-link></li>
    </dev>
</template>

<style>
    #Head {
        position: relative;
    }
    #ProjectTitle {
        color: red;
    }

    #UserAddress {
        color: blue;
        position: abusolute;
        right: 50px;
    }

</style>