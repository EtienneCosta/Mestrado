<template>
    <ConsultarUserRepos :id="$route.params.id"/>
</template>


<script>
import ConsultarUserRepos from "../components/ConsultarUserRepos.vue"
export default {
    components: {
        ConsultarUserRepos
    }
};
</script>