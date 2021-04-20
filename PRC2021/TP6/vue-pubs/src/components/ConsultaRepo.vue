<template>
  <div class="w3-container">
    <h3>Repositório {{ id }}</h3>

    <table class="w3-table-all">
        <tr>
            <th>Sujeito</th>
            <th>Predicato</th>
            <th>Objeto</th>
        </tr>

        <tr v-for="(triplo,i) in dados" :key=i>
            <td>{{id}}</td>
            <td>{{triplo.p}}</td>
            <td>{{triplo.o}}</td>
        </tr>
    </table>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Users",

  props: ["id"],

  data() {
    return {
      dados: null,
    };
  },

  created: function () {
    axios.get(
          "http://epl.di.uminho.pt:8738/api/rdf4j/query/A76089-TP5?query=PREFIX%20owl%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%20PREFIX%20%3A%20%3Chttp%3A%2F%2Fwww.di.uminho.pt%2Fprc2021%2Fpublicacoes%23%3E%20select%20%2A%20%20where%20%7B%3A"+this.id+"%20%3Fp%20%3Fo.%20%20%20%20%7D%20&infer=true"      )

      .then((res) => {
        this.dados = res.data.results.bindings.map((e) => {
            return {
                p: e.p.type == "literal" ? e.p.value : e.p.value.split("#")[1],
                o: e.o.type == "literal" ? e.o.value : e.o.value.split("#")[1]
            }
        })
      })
      .catch(e => {console.log("Erro na obtenção do repositório :: "+e)});
  },
};
</script>