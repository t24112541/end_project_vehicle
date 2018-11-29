<template>
  <div>
    <v-card>
    <h2 align="center" class="padding-top-mn">บันทึกการทำงาน</h2>
    <div class="cv_header">อุปกรณ์</div>
  <v-data-table
      :headers="headers"
      :items="datas"
      :search="search"
      :pagination.sync="pagination"
      :loading=state
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
    <template slot="items" slot-scope="props">
      <tr v-on:click="log_accessories_show(props.item.ac_id)">
        <td class="text-xs-center xs10">{{ props.item.count }}</td>
        <td class="text-xs-left xs10">{{ props.item.ac_name }}</td>
        <td class="text-xs-left">{{ props.item.ac_description }}</td>
        <td class="text-xs-left">{{ props.item.u_name }}</td>
      </tr>
    </template>
     <template slot="no-data">
        <v-alert :value="true" color="error" icon="warning">
         (-_-!) ไม่พบข้อมูล 
        </v-alert>
      </template>
  </v-data-table>
    </v-card>
  </div>
</template>

<script>

  export default {
    
    layout: 'manage',
    data () {
      return {

        state:false,
        search: '',
        pagination: {},
        selected: [],
        rows_per_page:[10,20,{"text":"แสดงทั้งหมด","value":-1}],//////////////////////////   teach me pleas!
        headers: [
          { text: 'การทำงาน', value: 'การทำงาน',align: 'center',sortable: false,  },
          { text: 'ชื่ออุปกรณ์',align: 'left',sortable: false, value: 'ชื่ออุปกรณ์'},
          { text: 'รายละเอียด', value: 'รายละเอียด',align: 'left', sortable: false,},
          { text: 'ผู้ดำเนินการ', value: 'ผู้ดำเนินการ',align: 'left',sortable: false,  },
        ],
        datas: []
      }
    },
    async created(){
      this.state=true
      let res=await this.$http.get('/log_list/log_accessories')
      //  console.log(res.data)
      this.datas=res.data.datas
      this.state=false
    },
    computed: {
      pages () {
        if (this.pagination.rowsPerPage == null || this.pagination.totalItems == null) return 0
        return Math.ceil(this.pagination.totalItems / this.pagination.rowsPerPage)
      },
      
    },
    methods:{
      log_accessories_show(ac_id){
        this.$router.push({path: '../accessories_log/show_log_accessories?ac_id='+ac_id})
      },
     
    }
  }
</script>