import '../models/user_model.dart';
const baseUrl = "https://dndun.urapp.site";
const baseurlImage = baseUrl+"/images/";
const baseurlMp3 = baseUrl+"/mp3/";
String token = "";
String tokenFCM = "";
UserModel currentUser = UserModel();

//end Points

const homePoint = "/dashboard-home";
const getCartsPoint = "/cart/get-carts";
const addCartPoint = "/cart/add-cart";
const deleteCartPoint = "/cart/delete-cart";
const updateCartPoint = "/cart/update-cart";
const validatePoint = "/auth/validate";
const loginPoint = "/auth/confirm-Code";
const registerPoint = "/auth/signup";
const getUserDetailsPoint = "/user/detail";
const updateUserDetailsPoint = "/user/update";
const checkUserNamePoint = "/auth/check-username";
const addFavPoint = "/favorite/add-favorite";
const getFavPoint = "/fav/get-Favorites";
const deleteFavPoint = "/fav/delete-Favorite";
const uploadImagePoint="/image/upload/car";
const getAddressesPoint="/address/get-addresses";
const addAddressPoint="/address/add";
const deleteAddressPoint="/address/delete";
const updateAddressPoint="/address/update";
const getPostsPoint="/post/get-posts";
const addPostPoint="/post/add-post";
const deletePostsPoint="/post/delete-post";
const updatePostPoint="/post/add-post";
const getCommentsPoint="/comment/get-comments";
const addCommentPoint="/comment/add-comment";
const deleteCommentPoint="/post/delete-post";
const updateCommentPoint="/post/add-post";
//PRODUCTS
const getProductsPoint="/product/get-products";
const getProductsByCategoryPoint="/product/get-products-by-category";
const searchProductsPoint="/post/search-posts";
const getOrdersPoint="/order/get-orders";
const addOrderPoint="/order/add-order";
const deleteOrderPoint="/order/delete-order";
const getOrderDetailsPoint="/order/get-Order-details";
//key shard
const userIdKey = "userId";
const tokenKey = "token";
const nameUserKey = "nameUser";
const phoneUserKey = "phone";
const userImageKey = "image";



