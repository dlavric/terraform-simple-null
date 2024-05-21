variable "mycount" {
  default = 26
}

resource "random_pet" "pet1" {
  prefix = timestamp()
  length = 1
}

output "pet1" {
  value = random_pet.pet1.*.id
}

resource "null_resource" "null1" {
  count = var.mycount
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = "echo ${random_pet.pet1.id}"
  }
}

output "null1" {
  value = null_resource.null1.*.id
}

resource "null_resource" "null2" {
  count = var.mycount
  triggers = {
    always_run = timestamp()
  }
}

output "null2" {
  value = null_resource.null2.*.id
}

resource "random_pet" "pet2" {
  count  = var.mycount
  prefix = timestamp()
}

output "pet2" {
  value = random_pet.pet2.*.id
}

resource "null_resource" "null3" {
  count = var.mycount
  triggers = {
    always_run = timestamp()
  }
}

output "null3" {
  value = null_resource.null3.*.id
}

resource "random_pet" "pet3" {
  count  = var.mycount
  prefix = timestamp()
}

output "pet3" {
  value = random_pet.pet3.*.id
}
