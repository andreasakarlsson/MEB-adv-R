library("pryr")

##############################################
## Motivation
##############################################


## Arvids example

library(survival)
rm(list=ls())

stdCoxph <- function(formula,data){

##         formula <- Surv(u,event)~x
## environment(formula) <- environment()

         tempdata <- data
         fit <- coxph(formula=formula,data=tempdata)
         ss <- survfit(formula=fit, se.fit=FALSE,censor=FALSE)
}

n <- 100
x <- rbinom(n,1,0.5)
u <- rexp(n,exp(0.5*x))
event <- rep(1,n)
data <- data.frame(u,event,x)
formula <- Surv(u,event)~x
#tempdata <- data

stdCoxph(formula=formula,data=data)

debug(stdCoxph)
stdCoxph(formula=formula,data=data)
unddebug(stdCoxph)


## Example from lm()

lm

mf <- eval(mf, parent.frame())

##############################################
## Environments
##############################################

## Gets the current environment
environment()

## The global environment, where we usually are
globalenv()

## The empty environment
emptyenv()

## The first and only descendant of the empty environment:L
## The base environment
baseenv()

## We can create new environments
e <- new.env()
e$a <- FALSE
e$b <- "a"
e$c <- 2.3
e$d <- 1:3

## List all environments in the global environment
## the 'subtree'
search()


## What is the parent environment?
parent.env(environment())
## What is the grandparent environment?
parent.env(parent.env(environment()))

## List contents of an environment
## See the objects in current environment
ls(envir=environment())
ls(pos=-1)
ls(pos=1)
## See the objects in parent environment
ls(envir=parent.env(environment()))
ls(pos=2)
## See the objects in grandparent environment
ls(pos=3)
## etc


##############################################
##############################################
## Functions 
##############################################
##############################################

##############################################
## The enclosing environment
##############################################

## The enclosing environment not the binding environment
e <- new.env()
e$g <- function() 1

environment(e$g)
g
x <- -1
e$f <- function() x
e$x <- 5
## The enclosing environmet
## where it looks for 'x'
environment(e$f)

##############################################
## The binding environment
##############################################

## The binding environmet is e
## where we find 'f'

## Compare these
f()
eval(f())

## With these
eval(e$f())
local(f(), envir=e)

## A variable not found in the currect environment
## will be searched for downwards in the stack
## and the first one will be returned
mean.default
environment(mean.default)

##############################################
## The execution environment
##############################################

## H Wickhams exmple

h <- function(x) {
  a <- 2
  x + a
}
y <- h(1)

##############################################
## The calling environment
##############################################

## H Wickhams exmple

x <- 0
y <- 10
f <- function() {
  x <- 1
  g()
}
g <- function() {
  x <- 2
  h()
}
h <- function() {
  x <- 3
  x + y
}
f()

debug(f)
debug(g)
debug(h)

f()

##############################################
## package environment  and namespaces
##############################################

## Let us look at 'sd' in the 'stats' package
sd

## The namespace
environment(sd)

## str( environment(sd) )

## The package environment (where 'sd' can be found)
where("sd")

## str( where("sd") )

## as.environment("package:stats")

######################################
## where()
######################################

## 'where' gets the binding environment of a named object
## searches throught the environment stack
where("pi")

######################################
## get()
######################################

## 'get' gets the value of a named object
## searches throught the environment stack

## The value of pi in the current environment
get("pi", pos=1)
## the argument inherits defaults to TRUE meaning that
## variables inherited from parent environment should be
## included
get("pi", pos=1, inherits=TRUE)
get("pi", pos=1, inherits=FALSE)
## pi is defined 9 generations back
get("pi", pos=10, inherits=FALSE)


