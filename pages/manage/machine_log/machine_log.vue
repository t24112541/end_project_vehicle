<template>
  <div>
    <v-card>
    <h2 align="center" class="padding-top-mn">บันทึกการทำงาน</h2>
    <div class="cv_header">ข้อมูลพาหนะ</div>
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
      <tr v-on:click="log_machine_show(props.item.mc_id)">
        <td class="text-xs-center xs10">{{ props.item.count }}</td>
        <td class="text-xs-left xs10">{{ props.item.mc_code }}</td>
        <td class="text-xs-left">{{ props.item.mc_brand }}</td>
        <td class="text-xs-left">{{ props.item.mc_series }}</td>
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
          { text: 'ทะเบียนรถ',align: 'left',sortable: false, value: 'ทะเบียนรถ'},
          { text: 'แบรนด์รถ', value: 'แบรนด์รถ',align: 'left', sortable: false,},
          { text: 'รุ่นรถ', value: 'รุ่นรถ',align: 'left',sortable: false,  },
          { text: 'ผู้ดำเนินการ', value: 'ผู้ดำเนินการ',align: 'left',sortable: false,  },
        ],
        datas: []
      }
    },
    async created(){
      this.state=true
      let res=await this.$http.get('/log_list/log_machine')
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
      log_machine_show(mc_id){
        this.$router.push({path: '../machine_log/show_log_machine?mc_id='+mc_id})
      },
     
    }
  }
</script>