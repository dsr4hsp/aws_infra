locals {
  tstamp = formatdate("DD-MMM-YYYY:hh-mm", timestamp())
}

locals {
  ser_conf = [
    for srv in var.ec2_conf : [
      for i in range(1, srv.inst_cnt+1) : {
        instance_name = "${srv.tier}-${i}"
        instance_type = srv.inst_type
        subnet_id     = srv.subnet_id
#        security_groups = srv.vpc_security_group_ids
      }
    ]
  ]
}


locals {
  instances = flatten(local.ser_conf)
}
