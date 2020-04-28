<template>
  <div id="app">
    <notifications
      duration="-3"
      closeOnClick="true"
      width="70%"
      position="top center"
      class="custom-notification-style"
    />
    <GameArena />
  </div>
</template>

<script>
import GameArena from "./components/GameArena.vue";

export default {
  name: "App",
  components: {
    GameArena
  }
};
</script>

<style>
.vue-notification {
  font-size: 20px;
}
</style>
