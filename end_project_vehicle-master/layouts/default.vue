<template>
  <div id="app">
  <v-app id="inspire">
   <v-toolbar color="blue darken-3"  dark tabs>
        <v-icon>fas fa-th</v-icon>
  
        <v-toolbar-title>ระบบบริหารยานพาหนะ</v-toolbar-title>
  
        <v-spacer></v-spacer>
        <v-btn icon>
          <v-icon>fas fa-cog</v-icon>
        </v-btn>
      </v-toolbar>
  
     <v-content>
      <nuxt/>
    </v-content>
    <div>
    <v-footer>
        <v-flex blue darken-3 py-3 text-xs-center white--text xs12>
          &copy;Vehicles Application — <strong>2018</strong>
        </v-flex>
    </v-footer>
    </div>
  </v-app>
</div>
</template>