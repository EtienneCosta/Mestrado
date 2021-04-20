<template>
  <div id="app">
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
      <!-- Brand -->
      <a class="navbar-brand"><router-link to="/">Open Web Ontobud</router-link></a>

      <!-- Links -->
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link"><router-link to="/authors">Authors</router-link></a>
        </li>
        <li class="nav-item">
          <a class="nav-link"><router-link to="/pubs">Publications</router-link></a>
        </li>
      </ul>
    </nav>
    <router-view />
  </div>
</template>


<style >

a{
  color:white;
  font-size: 18px;

}
</style>