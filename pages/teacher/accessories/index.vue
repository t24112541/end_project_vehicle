<template>
  <div>
    <v-card>
    <div class="cv_header padding-top-mn" >ข้อมูลอุปกรณ์เสริม</div>
    <div class="cv_header padding-top-mn"> 
      <v-text-field
              label="ค้นหาอุปกรณ์"
              append-icon="search"
              v-model="txt_search"
            ></v-text-field>
    </div>
    <div class="cv_header xs12">
      <v-btn
        color="green lighten-2"
        dark
        small
        absolute
        top
        right
        fab
        @click="accessories_add()"
      >
        <v-icon>add</v-icon>
      </v-btn>
    </div>
    <v-spacer></v-spacer>
  <v-data-table
      :headers="headers"
      :items="datas"
      :search="search"

      :loading=state
      class="elevation-1"
      prev-icon="fas fa-chevron-circle-left"
      next-icon="fas fa-chevron-circle-right"
      sort-icon="mdi-menu-down"
      rows-per-page-text="แสดง"
      :rows-per-page-items=rows_per_page
      
    >
    <template slot="headerCell" slot-scope="props">
      <v-tooltip bottom>
        <span slot="activator">
          {{ props.header.text }}
        </span>
        <span>
          {{ props.header.text }}
        </span>
      </v-tooltip>
    </template>
    <template slot="items" slot-scope="props" >
      <tr v-on:click="list_accessories(props.item.ac_id)">
        <td class="text-xs-left xs10">{{ props.item.ac_name }}</td>
        <td class="text-xs-left">{{ props.item.ac_description }}</td>
        <td class="text-xs-left">{{ props.item.ac_u_id }}</td>
      </tr>
    </template>
      <template slot="no-data">
        <v-alert :value="true" color="error" icon="warning">
          ไม่พบข้อมูล :(
        </v-alert>
      </template>
  </v-data-table>
    </v-card>
  </div>
</template>

<script>
  export default {
    layout: 'teacher',
    data () {
      return {
        txt_search:"",
        state:true,
        search: '',
        rows_per_page:[10,20,{"text":"แสดงทั้งหมด","value":-1}],//////////////////////////   teach me pleas!
        headers: [
          { text: 'ชื่อุปกรณ์',align: 'left',sortable: false, value: 'ชื่อุปกรณ์'},
          { text: 'รายละเอียด', value: 'รายละเอียด',align: 'left', sortable: false,},
          { text: 'เจ้าของอุปกรณ์', value: 'เจ้าของอุปกรณ์',align: 'left',sortable: false,  },
        ],
        datas:[]
      }
    },
    watch:{
      async txt_search(newValue){
        let s=newValue
        this.state=true
        let res=await this.$http.post('/accessories/search',{
          txt_search:s
        })
        // console.log(res.data)
        this.datas=res.data.datas
        this.state=false
      }
    },
    async created(){
      if(this.$route.query.g_code){
        let res=await this.$http.get('/accessories/list_g/'+this.$route.query.g_code)
        this.datas=res.data.datas
        this.state=false
      }else{
        let res=await this.$http.get('/accessories/list')
        this.datas=res.data.datas
        this.state=false
        // console.log(res.data.datas)
      }
      
      
    },
    methods:{
      list_accessories(ac_id){
        this.$router.push({path: '../teacher/accessories/edit_accessories?ac_id='+ac_id})
      },
      accessories_add(){
        this.$router.push({path:"../teacher/accessories/data_add_accessories"})
      }
     
    }
  }
</script>