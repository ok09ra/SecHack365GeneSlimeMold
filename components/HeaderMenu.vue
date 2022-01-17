<template>
    <div>
        <h1 id="ProjectTitle">GENE SLIME MOLD</h1>
        <p id="UserAddress">{{ $store.state.user_data.my_address }}</p>
        <p id="CoinValue">Gene Coin: {{$store.state.user_data.my_coin_value}} [GC]</p>
        <li><nuxt-link to="/" >Top page</nuxt-link></li>
        <li><nuxt-link to="/holder" >Gene Holder Page</nuxt-link></li>
        <li><nuxt-link to="/usereventmaker" >Use Event Maker Page</nuxt-link></li>
        <li><nuxt-link to="/miner" >Gene Miner Page</nuxt-link></li>
    </div>
</template>

<script>
console.log(this)
export default{
    name:"HeaderMenu",
    computed:{
    },
    methods : {
    },
}
</script>

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