import CoreGraphics
import UIKit


func twodmto3dm(A_x:Double, A_y:Double, B_x:Double, B_y:Double, C_x:Double, C_y:Double, screen_H:Double, screen_W:Double, vertical_angle:Double, horizontal_angle:Double) -> Double {
    let L = screen_H / (2 * tan(vertical_angle/2))
    let A_prime_x = A_x - screen_W/2
    let A_prime_y = A_y - screen_H/2
    let A_prime_z = L
    let B_prime_x = B_x - screen_W/2
    let B_prime_y = B_y - screen_H/2
    let B_prime_z = L
    let C_prime_x = C_x - screen_W/2
    let C_prime_y = C_y - screen_H/2
    let C_prime_z = L
    
    print(A_prime_x, A_prime_y, A_prime_z, B_prime_x, B_prime_y, B_prime_z, C_prime_x, C_prime_y, C_prime_z)
//    return A_prime_x; A_prime_y; A_prime_z; B_prime_x; B_prime_y; B_prime_z; C_prime_x; C_prime_y; C_prime_z


//func measure(A_prime_x=A_prime_x, A_prime_y=A_prime_y, A_prime_z=A_prime_z, B_prime_x:=B_prime_x, B_prime_y=B_prime_y, B_prime_z:=B_prime_z, C_prime_x=C_prime_x, C_prime_y=C_prime_y, C_prime_z=C_prime_z) {
    let dx_AB = (A_prime_x - B_prime_x)
    let dy_AB = (A_prime_y - B_prime_y)
    let dz_AB = (A_prime_z - B_prime_z)
    let dx_BC = (B_prime_x - C_prime_x)
    let dy_BC = (B_prime_y - C_prime_y)
    let dz_BC = (B_prime_z - C_prime_z)
    let dx_CA = (C_prime_x - A_prime_x)
    let dy_CA = (C_prime_y - A_prime_y)
    let dz_CA = (C_prime_z - A_prime_z)
    
    let distance_AB = (sqrt(dx_AB*dx_AB + dy_AB*dy_AB + dz_AB*dz_AB)/2.35)
    let distance_BC = (sqrt(dx_BC*dx_BC + dy_BC*dy_BC + dz_BC*dz_BC)/2.35)
    let distacne_CA = (sqrt(dx_CA*dx_CA + dy_CA*dy_CA + dz_CA*dz_CA)/2.35)
    
    print(distance_AB)
    print(distance_BC)
    print(distacne_CA)
    
    return distance_AB; distance_BC; distacne_CA
}


twodmto3dm(A_x: 511.07260986, A_y: 932.70751102, B_x: 2626.59113916, B_y: 526.95258979, C_x:114.55153967, C_y: 3035.51431833, screen_H: 4032, screen_W: 3024, vertical_angle: 63.44001316326884, horizontal_angle: 49.742171005655024)

twodmto3dm(A_x: 966, A_y: 1969, B_x: 1558.4867, B_y:1821.9686, C_x: 1473, C_y: 1284, screen_H: 4032, screen_W: 3024, vertical_angle: 63.44001316326884, horizontal_angle: 49.742171005655024)

twodmto3dm(A_x: 114.55153967, A_y: 3035.51431833, B_x: 2836.37674788, B_y: 3112.97704501, C_x: 2626.59113916, C_y: 526.95258979, screen_H: 4032, screen_W: 3024, vertical_angle: 63.44001316326884, horizontal_angle: 49.742171005655024)
//measure(A_prime_x: -588.0, A_prime_y: -572.0, A_prime_z: -7528.140289568768, B_prime_x: -39.0, B_prime_y: -732.0, B_prime_z: -7528.140289568768, C_prime_x: 46.48669999999993, C_prime_y: -194.03140000000008, C_prime_z: -7528.140289568768)


//let d_AB = 260
//let d_BC = 260
//let d_CA = 260 * sqrt(2)
//
//var OA = k * e_A
//
//func measure(d_AB, d_BC, d_CA, )


//print(sqrt(4))





//func px_to_mm(TR_x:Double=1473, TR_y:Double=1284, BL_x:Double=966, BL_y:Double=1696, TL_x:Double=924, TL_y:Double=1444, BR_x:Double=1558.4867, BR_y:Double=1821.9686, x_1:Double, y_1:Double, x_2:Double, y_2:Double) -> Double {
//    var dt1 = abs(Double(TR_x - BL_x))
//    var dt2 = abs(Double(TR_y - BL_y))
//    var dt3 = abs(Double(TL_x - BR_x))
//    var dt4 = abs(Double(TL_y - BR_y))
//
//
//    var diag_1 = (260 * sqrt(2) / sqrt(dt1*dt1 + dt2*dt2))
//    var diag_2 = (260 * sqrt(2) / sqrt(dt3*dt3 + dt4*dt4))
//
//
//
//    var adjust = (diag_1 + diag_2) / 2
//
//    print(adjust)
//
//    var m1 = abs(Double(x_1 * adjust - x_2 * adjust))
//    var m2 = abs(Double(y_1 * adjust - y_2 * adjust))
//    var result = sqrt(m1*m1 + m2*m2)
//
//    print(result)
//    return result
//}
//
//px_to_mm(x_1: 511.07260986, y_1: 932.70751102, x_2: 2836.37674788, y_2: 3112.97704501)
//
//px_to_mm(TR_x: 1473, TR_y: 1284, BL_x: 966, BL_y: 1969, TL_x: 924, TL_y: 1444, BR_x: 1558.4867, BR_y: 1821.9686, x_1: 2836.37674788, y_1: 3112.97704501, x_2: 114.55153967, y_2: 3035.51431833, d_distance: 260 * sqrt(2), l_distance: 260)
//
//px_to_mm(TR_x: 2626.59113916, TR_y: 526.95258979, BL_x :114.55153967, BL_y: 3035.51431833, TL_x: 511.07260986, TL_y: 932.70751102, BR_x: 2836.37674788, BR_y: 3112.97704501, x_1: 511.07260986, y_1: 932.70751102, x_2: 2836.37674788, y_2: 3112.97704501, real_distance: 1000)
//    let p1 = CGPoint(x: 1473, y: 1284)
//    let p2 = CGPoint(x_2: 966, y_2: 1969)
//    var dx = Double(p1 - p2)
//    let dy = Double(p1.y_1 - p2.y_2)
//    var ans_1 = (260 * sqrt(2)) / sqrt(dx_1*dx_1 + dy_1*dy_1)


//func px_to_mm_2(x_3:Int, y_3:Int, x_4:Int, y_4:Int) {
//    var dx_2 = abs(Double(x_3 - x_4))
//    var dy_2 = abs(Double(y_3 - y_4))
//
//    var ans_2 = (260 * sqrt(2)) / sqrt(dx_2*dx_2 + dy_2*dy_2)
//
//    var final_ans = (ans_1 + ans_2) / 2
//}



//print(change)


//let p3 = CGPoint(x:924, y:1444)
//let p4 = CGPoint(x:1558.4867, y: 1821.9686)
//let dx_1 = Double(p3.x - p4.x)
//let dy_1 = Double(p3.y - p4.y)
//var change_1 = (260 * sqrt(2)) / sqrt(dx_1*dx_1 + dy_1*dy_1)
//print(change_1)
//var adjust = (change+change_1)/2
//print(adjust)
//
//let p5 = CGPoint(x:511.07260986 * adjust, y: 932.70751102 * adjust)
//let p6 = CGPoint(x:2626.59113916 * adjust, y: 526.95258979 * adjust)
//let dx_2 = Double(p5.x - p6.x)
//let dy_2 = Double(p5.y - p6.y)
//print(sqrt(dx_2*dx_2 + dy_2*dy_2))
