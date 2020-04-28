<template>
  <div class="board">
    <ul>
      <div v-for="(row, i) in board" :key="i">
        <div v-for="(col, j) in row" :key="j">{{col}}</div>
      </div>
    </ul>
  </div>
</template>

<script>
export default {
  name: "GameArena",
  data() {
    return {
      board: [
        ["A", "B", "C"],
        ["D", "E", "F"],
        ["G", "H", "I"]
      ]
    };
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
