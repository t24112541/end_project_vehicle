<template>
    <div>

            <nuxt/>

        <v-footer
            dark
            height="auto"
        >
            <v-card
            class="flex"
            flat
            tile
            >
            <v-card-title class="teal">
                <strong class="subheading">ระบบอยู่ในระหว่างทดลองใช้งาน</strong>

                <v-spacer></v-spacer>

                <v-btn
                v-for="icon in icons"
                :key="icon"
                class="mx-3"
                dark
                icon
                >
                <v-icon size="24px">{{ icon }}</v-icon>
                </v-btn>
            </v-card-title>

            <v-card-actions class="grey darken-3 justify-center">
                &copy;2018 — <strong>Infotmation Technology</strong>
            </v-card-actions>
            </v-card>
        </v-footer>
    </div>
  
</template>

<script>
  export default {
    data: () => ({
      icons: [
       
      ]
    })
  }
</script>
