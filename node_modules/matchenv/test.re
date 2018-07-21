module A = {
let a = 10;
};

module B = {
let b = 10;
};

include
  [%matchenv
    switch (GL_BACKEND) { 
    | "native" => A
    | "web" => B
   }];
