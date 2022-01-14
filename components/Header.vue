<template>
    <dev id="Head">
        <h1 id="ProjectTitle">GENE SLIME MOLD</h1>
        <p id="UserAddress">ADDRESS</p>
        <nuxt-link to="/holder" > ホルダーページ</nuxt-link>
        <nuxt-link to="/usereventmaker" > ユーズイベントメイカーページ</nuxt-link>
        <nuxt-link to="/miner" > マイナーページ</nuxt-link>
    </dev>
</template>

<style>
    #Head {
        position: absolute;
        background-color: black;
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