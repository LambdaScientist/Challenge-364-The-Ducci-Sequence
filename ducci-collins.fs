open System

let ducci xs =
    let diff xs =
        (List.last xs) :: xs
        |> List.pairwise
        |> List.map (fun (x,y) -> x - y |> abs)
    let allZeros = List.forall ((=) 0)
    let hasCycle = List.contains

    let rec ducci' acc =
        let xs' = acc |> List.head |> diff
        if allZeros xs' || hasCycle xs' acc
        then xs' :: acc
        else ducci' (xs' :: acc)
        
    ducci' [xs]

let printResults xs =
    let results = xs
                  |> List.rev 
                  |> List.map (sprintf "%A")
                  |> String.concat "\n"
    let steps = List.length xs
    
    sprintf "%s\n%d steps" results steps

[<EntryPoint>]
let main argv =
    let inputs = [ [1; 5; 7; 9; 9]
                   [1; 2; 1; 2; 1; 0]
                   [10; 12; 41; 62; 31; 50]
                   [10; 12; 41; 62; 31]
                   [0; 653; 1854; 4063] ]
    
    inputs
    |> List.map ducci
    |> List.map printResults
    |> List.iter (printfn "%s\n\n")
    

    0 // return an integer exit code
