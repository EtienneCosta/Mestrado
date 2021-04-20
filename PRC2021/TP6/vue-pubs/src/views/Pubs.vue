<template>
  <div class="w3-container">
  <br>
    <h3>Publicações</h3>
    <table class="w3-table-all">
      <thead>
        <tr>
          <th>Id</th>
          <th>Type</th>
          <th>Title</th>
          <th>Year</th>
        </tr>
      </thead>

      <tbody>
        <tr v-for="r in repos"  v-bind:key="r.id"  @click="goRepo(r.id)" >
          <td>{{ r.id }}</td>
          <td>{{ r.type }}</td>
          <td>{{ r.title }}</td>
          <td>{{ r.year }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Pubs",

  data() {
    return {
      repos: null,
    };
  },
  created: function () {
    axios.get("http://localhost:7777/pubs")
      .then((res) => {
        this.repos = res.data;       
      })
      .catch(e => {console.log("Erro na obtenção da lista de publicações "+e)});
  },
  methods: {
    goRepo: function (id) {
      this.$router.push("/pubs/" + id);
    },
  },
};
</script>