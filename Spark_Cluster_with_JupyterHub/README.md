# Spark Cluster with Jupyter (Notebook)
## A. Introduction
Le code à base de scripts Python et Shell permet d'initialiser et configurer un cluster Spark avec JupyerHub associé au master. Le nombre de noeuds associés au master est fonction du nombre de requêtes effectuées du lancement d'un noeud.

## B. Déroulement
Les étapes pour lancer ce cluster sont les suivantes:

1. Lancement de la VM relative au master

```
    $ python ./bootVMNB-M.py LB-VM04-M01 udataNB-M.txt <CR>
    ...
    status: ACTIVE (boot in 15 sec)
    IP Internet = 187.9.2.145
    $
```

2. Attente de l'instanciation de la VM, de l'initialisation et de la configuration des composants logiciels (Spark & Jupyter). Vérification du bon déploiement en accèdant à l'interface Web UI du cluster Spark (ex: http://187.9.2.145:8080), voire à la bannière de login du service Jupyter (ex: http://187.9.2.145/hub/login). En cas de dysfonctionnement, se connecter au master via SSH et vérifier l'état du déploiement dans le fichier "/root/bootVM.log".

3. Lancement de la VM relative au 1er noeud (worker) du cluster à l'aide de la syntaxe donnée ci-dessous. Cette opération est à réitérer selon le nombre de noeuds désirés. L'adresse IP locale du master est donnée en paramètre.

```
    $ python ./bootVMNB-S.py LB-VM04-S01 50.12.9.138 udataNB-S.txt <CR>
    ...
    status: ACTIVE (boot in 15 sec)
    $ python ./bootVMNB-S.py LB-VM04-S02 50.12.9.138 udataNB-S.txt <CR>
    ...
    status: ACTIVE (boot in 15 sec)
    $
```

4. Vérification de l'état opérationnel du cluster. Son interface Web UI doit faire apparaître les 2 noeuds lancés.

5. Pour s'identifier et s'authentifier sur Jupyter, il est nécessaire de créer des comptes sur le master à l'aide des commandes classiques de Linux, voire de le faire en mode SSH de la façon suivante:

```
    $ ssh -i KP-OMC-01 root@187.9.2.145 /root/bin/scuser.sh hd1 hd1 <CR>
    Enter new UNIX password: Retype new UNIX password: passwd: password updated successfully
    $
```

