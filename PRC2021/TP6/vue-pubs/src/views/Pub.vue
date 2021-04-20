<template>
    <ConsultaRepo :id="$route.params.id"/>
</template>

<script>
import ConsultaRepo from "../components/ConsultaRepo.vue"
export default {
    components: {
        ConsultaRepo
    }
};
</script>