resource "null_resource" "null" {
    count = 2

    provisioner "file" {
        source = "null.sh"
        destination = "/tmp/null.sh"
        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = "${file("private_key.pem")}"
            host = "${element(aws_instance.ec2.*.public_ip, count.index)}"
        }
    }
    provisioner "remote-exec" {
       inline = [
           "sudo su -",
           "chmod 777 /tmp/null.sh",
           "sh /tmp/null.sh",

       ]
        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = "${file("private_key.pem")}"
            host = "${element(aws_instance.ec2.*.public_ip, count.index)}"
        }
    }
    provisioner "local-exec" {
        command = echo "${element(aws_instance.ec2.*.public_ip, count.index)}" >> detaails.txt 
    }
}