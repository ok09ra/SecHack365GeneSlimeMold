<template>
  <div>
    <HeaderMenu />
    <h1>by taiyaki</h1>
  </div>
</template>

<script>
export default {
  name:"index",
  components:{
    HeaderMenu: () => import("~/components/HeaderMenu"),
  }
}
</script>
