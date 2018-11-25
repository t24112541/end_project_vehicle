
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
        <v-flex xs7 >
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
        <v-flex xs2 >
          <v-dialog v-model="conf_del" persistent max-width="290">
            <v-btn slot="activator" flat color="red lighten-2"><i class="fas fa-trash-alt fa-2x"></i></v-btn>
            <v-card>
              <v-card-title class="headline">ยืนยันการลบข้อมูล</v-card-title>
              <v-card-text>ต้องการลบข้อมูล {{mc_code}}<br> ใช่หรือไม่?</v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="red lighten-2" flat @click.native="conf_del = false">ไม่ใช่</v-btn>
                <v-btn color="primary" flat @click="machines_del()">ใช่</v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
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
                <v-card class="grey lighten-4 paddign"> 
                  <v-img :src="this.img_font" height="200"></v-img>
                  <v-card-actions>
                    <span class="subheading display-1 "><i class="fas fa-image fa-2x"></i></span>
                    <v-spacer></v-spacer>
                    <span class="subheading display-1 ">รูปด้านหน้า</span>
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
                <v-card class="grey lighten-4 paddign" > 
                  <v-img :src="this.img_side" height="200"></v-img>
                  <v-card-actions >
                    <span class="subheading display-1 "><i class="fas fa-image fa-2x"></i></span>
                    <v-spacer></v-spacer>
                    <span class="subheading display-1 ">รูปด้านข้าง</span>
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
                <v-card class="grey lighten-4 paddign" > 
                  <v-img :src="this.img_rear" height="200"></v-img>
                  <v-card-actions >
                    <span class="subheading display-1 "><i class="fas fa-image fa-2x"></i></span>
                    <v-spacer></v-spacer>
                    <span class="subheading display-1 ">รูปด้านหลัง</span>
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
                  name="mc_series"
                  v-model="mc_series"
                ></v-text-field>
              </v-layout>
            </v-flex>
           
          </v-layout>
        </v-container>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn flat color="red lighten-2" @click="machine()">ย้อนกลับ</v-btn>
          <v-btn flat color="primary" :disabled="!isEditing" @click="machine_update(mc_id)">บันทึก</v-btn>
        </v-card-actions>
    </v-card>
</template>

<script>
    export default {
        layout: 'manage',

        data () {
            return {
              mc_id:"",
              mc_code:"",
              mc_brand:"",
              mc_series: '',
              std_id: '',

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

              mc_id:this.$route.query.mc_id,
              u_id:sessionStorage.getItem("username")
            })
            if(res.data.ok==true){this.$router.push({name:"manage-machines"})}
            else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}
          },
          async sh_machine(){
            let res=await this.$http.get('/machine/sh_machine/'+this.$route.query.mc_id)
            // console.log(res.data.datas)
            this.mc_id=this.$route.query.mc_id
            this.mc_code=res.data.datas[0].mc_code
            this.mc_brand=res.data.datas[0].mc_brand
            this.mc_series=res.data.datas[0].mc_series
            this.std_prename=res.data.datas[0].std_prename
            this.std_name=res.data.datas[0].std_name
            this.std_lastname=res.data.datas[0].std_lastname

            this.img_font=res.data.datas[0].img_img
            this.img_font_id=res.data.datas[0].img_id

            this.img_side=res.data.datas[1].img_img
            this.img_side_id=res.data.datas[1].img_id

            this.img_rear=res.data.datas[2].img_img
            this.img_rear_id=res.data.datas[2].img_id

            // console.log(res.data.datas)
          },
          async machine_update(mc_id){
            //console.log("mc_id"+mc_id)
            let res=await this.$http.post("/machine/machine_update",{
              mc_code:this.mc_code,
              mc_brand:this.mc_brand,
              mc_series:this.mc_series,
              std_id:this.std_id,
              mc_id:mc_id,

              img_font:this.img_font,
              img_side:this.img_side,
              img_rear:this.img_rear,

              img_font_id:this.img_font_id,
              img_side_id:this.img_side_id,
              img_rear_id:this.img_rear_id,
            })
            console.log(res.data)
              if(res.data.ok==true){this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt,this.sh_machine()}
             else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}
          },
          machine(){
            this.$router.push({name:"manage-machines"})
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