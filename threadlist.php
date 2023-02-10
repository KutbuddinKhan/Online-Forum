<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style>
    #ques {
        min-height: 433px;
    }
    </style>
    <title>Welcome to iDiscuss - Coding Forums</title>
</head>

<body>
    <!-- NavBar -->
    <?php include 'partials/_header.php';?>
    <?php include 'partials/_dbconnect.php';?>

    <!-- Database connect thread list -->
    <?php
        $id = $_GET['catid'];
        $sql = "SELECT * FROM `categories` WHERE category_id=$id"; 
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_assoc($result)){
            $catname = $row['category_name'];
            $desc = $row['category_description'];
        }
    ?>

    <?php
        $showAlert = false;
        $method =  $_SERVER['REQUEST_METHOD'];
        // echo $method;
        if($method == 'POST'){
            // Insert into thread db
            $th_title = $_POST['title']; //form id and name
            $th_desc = $_POST['desc'];
            $sql = "INSERT INTO `threads` (`thread_title`, `thread_description`, `thread_cat_id`, `thread_user_id`, `timestamp`) VALUES ('$th_title', '$th_desc', '$id', '0', current_timestamp())";
            $result = mysqli_query($conn, $sql);
            $showAlert = true;
            if($showAlert){
                echo '<div class="alert alert-success alert-dismissible   fade show" role="alert">
                            <strong>Success! </strong> 
                            Your thread has been added! Please wait for community to respond.
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                      </div>
                ';
            }
        }
    ?>

    <!-- Categories container start here -->
    <div class="container my-4">
        <div class="jumbotron">
            <h1 class="display-4">Welcome to <?php echo $catname; ?> Forums</h1>
            <p class="lead"><?php echo $desc; ?> </p>
            <hr class="my-4">
            <p>This is a peer to peer forum. No Spam / Advertising / Self-promote in the forums is not allowed. Do
                not post copyright-infringing material. Do not post “offensive” posts, links or images. Do not cross
                post questions. Remain respectful of other members at all times.</p>
            <a class="btn btn-success btn-lg" href="#" role="button">Learn more</a>
            <!-- <p>Posted by: <em></em></p> -->
        </div>
    </div>

    <div class="container">
        <h1 class="py-2">Start a Discussions</h1>
        <!-- form -->
        <form action="<?php echo $_SERVER['REQUEST_URI']; ?>" method="post">
            <!-- <form action="/Zaiba/threadlist.php?catid=" .$id method="post"> -->
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Problem Title</label>
                <input type="text" class="form-control" id="title" name="title" aria-describedby="title">
                <small id="emailHelp" class="form-text">Keep your title as short and crisp as possible</small>
            </div>
            <div class="form-group">
                <label for="exampleFormControlTextArea1">Ellaborate Your Concern</label>
                <textarea class="form-control" id="desc" name="desc" rows="3"></textarea>
            </div>

            <button type="submit" class="btn btn-success">Submit</button>
        </form>
    </div>

    <div class="container" id="ques">
        <h1 class="py-2">Browse Question</h1>

        <?php
            $id = $_GET['catid'];
            $sql = "SELECT * FROM `threads` WHERE thread_cat_id=$id"; 
            $result = mysqli_query($conn, $sql);
            $noResult = true;
            while($row = mysqli_fetch_assoc($result)){
                $noResult = false;
                $id = $row['thread_id'];
                $title = $row['thread_title'];
                $desc = $row['thread_description'];
                $thread_time = $row['timestamp'];
                $thread_user_id = $row['thread_user_id'];
                $sql2 = "SELECT user_email FROM `users` WHERE sno='$thread_user_id'";
                $result2 = mysqli_query($conn, $sql2);
                $row2 = mysqli_fetch_assoc($result2);
                // $row2['user_email'];



                echo '<div class="media my-3">
                    <img class="mr-3" src="img/user-default.png" width="60px" alt="">
                    <div class="media-body">' . 
                        '<h5 class="mt-0"> <a class="text-dark" href="thread.php?threadid='. $id .'"> '. $title .'</a></h5>
                        '. $desc .' </div>' . '<p class="font-weight-bold my-0"> ASked by: ' . $row2['user_email']. ' at '. $thread_time.'</p>'. 
                '</div>';
            }
            // echo var_dump($noResult);
            if($noResult){
                echo '<div class="jumbotron jumbotron-fluid">
                    <div class="container">
                        <p class="display-4">No Thread Found</p>
                        <p class="lead">Be the first person to ask a question</p>
                    </div>
                </div>';
            }
        ?>



        <!-- media template -->

        <!-- <div class="media my-3">
            <img class="mr-3" src="img/user-default.png" width="60px" alt="">
            <div class="media-body">
                <h5 class="mt-0"> Unable to install pyaudio.</h5>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam aperiam dolore suscipit necessitatibus
                alias voluptatum rerum libero voluptatem accusamus, voluptas odit sit quam id? Aliquam consequuntur
                tempora facilis exercitationem animi!
            </div>
        </div> -->

    </div>


    <!-- Footer -->
    <?php include 'partials/_footer.php';?>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous">
    </script>
</body>

</html>