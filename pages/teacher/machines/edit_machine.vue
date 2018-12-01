
<template>
    <v-card>
      <v-alert
        v-model="danger"
        dismissible
        :type=type_api
      >
        {{alt_txt}}
      </v-alert>
        <v-card-title
          class="grey lighten-4 py-4 title"
        >
        <v-flex xs10 >
          แก้ไขข้อมูลพาหนะ
        </v-flex>
        <v-flex xs2 >
          <v-btn 
            color="green lighten-2"
            flat
            @click="isEditing = !isEditing"
          >
            <i v-if="isEditing" class="fas fa-times fa-2x"></i>
            <i v-else class="fas fa-edit fa-2x "></i>
          </v-btn>
        </v-flex>
       
        </v-card-title>
        <v-container grid-list-sm class="pa-4">
          <v-layout row wrap>

                        <!-- image zone -->

              <v-flex xs4 
                @click="$refs.img_font.click()" 
                style="cursor: pointer;"
              >
                <input 
                  :disabled="!isEditing"
                  type="file" 
                  style="display:none;" 
                  accept="image/*" 
                  multiple  
                  @change="upload_img_font($event)" 
                  ref="img_font"
                >
                <v-card height="100%" class="grey lighten-4 paddign"> 
                  <img :src="this.img_font" width="100%">
                  <v-card-actions style="font-size:100%">
                    <span><i class="fas fa-image fa-2x"></i></span>
                    <v-spacer></v-spacer>
                    <span>รูปด้านหน้า</span>
                  </v-card-actions>
                </v-card>
              </v-flex>
              <!-- end 1 -->

              <v-flex xs4 class="text-xs-center" 
                @click="$refs.img_side.click()" 
                style="cursor: pointer;"
              >
                <input 
                  :disabled="!isEditing"
                  type="file" 
                  style="display:none;" 
                  accept="image/*" 
                  multiple  
                  @change="upload_img_side($event)" 
                  ref="img_side"
                >
                <v-card height="100%" class="grey lighten-4 paddign" > 
                  <img :src="this.img_side" width="100%">
                  <v-card-actions style="font-size:100%">
                    <span><i class="fas fa-image fa-2x"></i></span>
                    <v-spacer></v-spacer>
                    <span>รูปด้านข้าง</span>
                  </v-card-actions>
                </v-card>
              </v-flex>
              <!-- end 2 -->
              <v-flex xs4 class="text-xs-center" 
                @click="$refs.img_rear.click()" 
                style="cursor: pointer;"
              >
                <input 
                  :disabled="!isEditing"
                  type="file" 
                  style="display:none;" 
                  accept="image/*" 
                  multiple  
                  @change="upload_img_rear($event)" 
                  ref="img_rear"
                >
                <v-card height="100%" class="grey lighten-4 paddign" > 
                  <img :src="this.img_rear" width="100%">
                  <v-card-actions style="font-size:100%">
                    <span><i class="fas fa-image fa-2x"></i></span>
                    <v-spacer></v-spacer>
                    <span>รูปด้านหลัง</span>
                  </v-card-actions>
                </v-card>
              </v-flex>

            <v-flex xs12 >
              <v-layout align-center>
                <v-text-field
                  :disabled="true"
                  maxlength="50"
                  counter
                  prepend-icon="fas fa-user"
                  label="ชื่อเจ้าของพาหนะ"
                  v-model="std_name"
                ></v-text-field>
              </v-layout>
            </v-flex>
            <v-flex xs12 >
              <v-layout align-center>
                <v-text-field
                  :disabled="!isEditing"
                  :rules="[rules.required]"
                  maxlength="50"
                  counter
                  prepend-icon="fas fa-id-card-alt fa-2x"
                  label="ทะเบียนรถ"
                  placeholder="ทะเบียนรถ"
                  name="mc_code"
                  v-model="mc_code"
                ></v-text-field>
              </v-layout>
            </v-flex>
            <v-flex xs12 >
              <v-layout align-center>
                <v-text-field
                  :disabled="!isEditing"
                  :rules="[rules.required]"
                  maxlength="100"
                  counter
                  placeholder="แบรนด์รถ"
                  label="แบรนด์รถ"
                  prepend-icon="fas fa-car"
                  name="mc_brand"
                  v-model="mc_brand"
                ></v-text-field>
              </v-layout>
            </v-flex>
            <v-flex xs12 >
              <v-layout align-center>
                <v-text-field
                  :disabled="!isEditing"
                  maxlength="100"
                  counter
                  prepend-icon="fas fa-tachometer-alt"
                  placeholder="รุ่นรถ"
                  label="รุ่นรถ"
                  name="mc_series"
                  v-model="mc_series"
                ></v-text-field>
              </v-layout>
            </v-flex>
           
          </v-layout>
        </v-container>
        <v-card-actions>
          
          <v-btn flat color="red lighten-2" @click="machine()"><i class="fas fa-arrow-circle-left fa-2x"></i></v-btn>
          <v-spacer></v-spacer>

          <v-btn flat color="orange accent-4" @click="missing(mc_id)" >
            <v-flex xs12>
              <i class="fas fa-exclamation fa-2x"></i>
            </v-flex>
            <v-flex xs12>
              แจ้งพาหนะสูญหาย
            </v-flex>
          </v-btn>

          <v-spacer></v-spacer>
          <v-btn flat color="green lighten-2" :disabled="!isEditing" @click="machine_update(mc_id)"><i class="fas fa-save fa-2x"></i></v-btn>
        </v-card-actions>
    </v-card>
</template>

<script>
    export default {
        layout: 'teacher',

        data () {
            return {
              ms:null,

              mc_id:"",
              mc_code:"",
              mc_brand:"",
              mc_series: '',
              std_code: '',

              img_font:"",
              img_side:"",
              img_rear:"",

              img_font_id:"",
              img_side_id:"",
              img_rear_id:"",

              type_api:"",
              danger:false,
              conf_del:false,
              isEditing:null,
              rules: {
                    required: value => !!value || 'ห้ามว่าง.',
                    // counter: value => value.length <= 10 || 'เต็ม 10 ตัวอักษร',
              },
            }
        },
        async created(){
          this.sh_machine()
        },
        methods:{
          conf_del(){this.conf_del=true},
          async machines_del(){
            let res=await this.$http.post('/machine/machine_del/',{
              mc_code:this.mc_code,
              mc_brand:this.mc_brand,
              mc_series:this.mc_series,
              std_id:this.std_code,
              mc_id:this.$route.query.mc_id,
              u_id:sessionStorage.getItem("username")
            })
            if(res.data.ok==true){this.machine()}
            else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}
          },
          async sh_machine(){
            let res=await this.$http.get('/machine/sh_machine/'+this.$route.query.mc_id)
            console.log(res.data.datas)
            this.mc_id=this.$route.query.mc_id
            this.mc_code=res.data.datas[0].mc_code
            this.mc_brand=res.data.datas[0].mc_brand
            this.mc_series=res.data.datas[0].mc_series
            this.std_prename=res.data.datas[0].std_prename
            this.std_code=res.data.datas[0].std_code
            this.std_name=res.data.datas[0].std_name
            this.std_lastname=res.data.datas[0].std_lastname

            this.img_font=res.data.datas[0].img_img
            this.img_font_id=res.data.datas[0].img_id

            this.img_side=res.data.datas[1].img_img
            this.img_side_id=res.data.datas[1].img_id

            this.img_rear=res.data.datas[2].img_img
            this.img_rear_id=res.data.datas[2].img_id

            // if(!this.$route.query.ms){this.ms=!this.ms}
            // console.log(res.data.datas)
          },
          async machine_update(mc_id){
            //console.log("mc_id"+mc_id)
            let res=await this.$http.post("/machine/machine_update",{
              mc_code:this.mc_code,
              mc_brand:this.mc_brand,
              mc_series:this.mc_series,
              std_id:this.std_code,
              mc_id:mc_id,

              img_font:this.img_font,
              img_side:this.img_side,
              img_rear:this.img_rear,

              img_font_id:this.img_font_id,
              img_side_id:this.img_side_id,
              img_rear_id:this.img_rear_id,

              u_id:sessionStorage.getItem("username")
            })
            console.log(res.data)
              if(res.data.ok==true){this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt,this.sh_machine()}
             else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}
          },
          machine(){
            this.$router.push({name:"teacher-machines"})
          },
          async missing(mc_id){
            let res=await this.$http.post("/missing/missing",{
              u_id:mc_id,
              ms_table:"pk_machine",
              ms_u_id:sessionStorage.getItem("username"),
              ms_u_table:sessionStorage.getItem("status"),
              ms_status:"ขั้นที่ 1 รอรับเรื่อง",
            })
             if(res.data.ok==true){this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt,this.sh_machine()}
             else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}
          },
          upload_img_font(e){
            const image = e.target.files[0];
            const reader = new FileReader();
            reader.readAsDataURL(image);
            reader.onload = e =>{              
              this.img_font=e.target.result;
              console.log(this.img_font);
            };
          },
          upload_img_side(e){
            const image = e.target.files[0];
            const reader = new FileReader();
            reader.readAsDataURL(image);
            reader.onload = e =>{              
              this.img_side=e.target.result;
              // console.log("this.img_side");
              console.log(this.img_side);
            };
          },
          upload_img_rear(e){
            const image = e.target.files[0];
            const reader = new FileReader();
            reader.readAsDataURL(image);
            reader.onload = e =>{              
              this.img_rear=e.target.result;
              console.log(this.img_rear);
            };
          },
        }
    }
</script>