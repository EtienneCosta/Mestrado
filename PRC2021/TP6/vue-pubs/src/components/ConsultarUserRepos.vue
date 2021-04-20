<template>
  <div class="w3-container">
    <h3>{{ id }} Publications</h3>

    <table class="w3-table-all">
        <tr>
            <th>#</th>
            <th>Id</th>
            <th>Type</th>
            <th>Title</th>
            <th>Year</th>

        </tr>
           <tbody>
        <tr v-for="(r,i) in pubs"  v-bind:key="r.id">
          <td>{{i}}</td>
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

  props: ["id"],

  data() {
    return {
      pubs: null,
    };
  },

  created: function () {
    axios.get("http://localhost:7777/authors/pubs/" +this.id)
      .then(res => {
        this.pubs=res.data
      })
      .catch(e => {console.log("Erro na obtenção do repositório :: "+e)});
  },
};
</script>