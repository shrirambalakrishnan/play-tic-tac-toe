<template>
  <div class="board">
    <div>
      <div class="row-item" v-for="(row, i) in board" :key="i">
        <div class="col-item" v-for="(col, j) in row" :key="j">
          <div class="element" v-on:click="elementOnClickHandler(i, j)">{{board[i][j]}}</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "GameArena",
  data() {
    return {
      board: [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""]
      ],
      moves: [],
      current_move_char: "X"
    };
  },
  methods: {
    flipCurrentMoveChar: function() {
      this.current_move_char = this.current_move_char == "X" ? "O" : "X";
    },
    elementOnClickHandler: function(x, y) {
      console.log(`(x,y) = (${x}, ${y})`);

      if (this.board[x][y]) {
        this.$notify({
          type: "warn",
          text: "Selected box already has a value. Please select an empty box."
        });
        return;
      }

      // The below code will not work.
      // Ref - https://vuejs.org/v2/guide/reactivity.html#Change-Detection-Caveats
      //
      // updatedBoard[x][y] = this.current_move_char;
      //
      this.$set(this.board[x], y, this.current_move_char);

      this.flipCurrentMoveChar();

      console.log("Updated values...");
      console.log(this.current_move_char);
      console.log(this.board);
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.row-item {
  margin: 0px 150px 0px 150px;
}

.col-item {
  display: inline-block;
  border: 1px solid;
  width: 200px;
  height: 200px;
}

.element {
  display: inline-block;
  height: 100%;
  width: 100%;
  vertical-align: middle;
  text-align: center;
}
</style>
