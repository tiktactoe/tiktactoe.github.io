program TicTacToe;
{
    size: the size of the board
}
const
   size = 9;
{
    tictac: is the type of array with a specific size 
}
type
   tictac = array [1..size] of integer;
{
    endprocess: variable to determine if the game is over or not
    user1: position that the user insert to put the character
    user2: position that the machine insert to put the character
    counter: variable used to read the board
    turn: counter that indicate how many movements there are
    boar: array where the movements are inserted
    usermsg: variable to know what user is playing
    message: variable to know who won or if its a draw
}
var
    endprocess: boolean;
    user1, user2, counter, turn: integer;
    board: tictac;
    usermsg, message: string;

{
    This function prints characters
}    
function printCharacter(j: integer): Char;
    begin
        if (board[j]=0) then
            exit('O');
        if (board[j]=1) then
            exit('X');
        if (board[j]=2) then
            exit(' ');
    end;

{
    This function let us initialize the board with empty values represent by the number 2
}
function start_board(): real;
begin
    for counter := 1 to size do
        board[ counter ] := 2;
end;
{
    This function let us validate if the user inserted a valid position
}
function valid_pos(pos: integer): boolean;
begin
    if board[pos] = 2 Then
    begin
        valid_pos := true;
    end
    else
    begin
        valid_pos := false;
    end;
end;
{
    This function insert in the board in a specific position the value
}
function insert_board_user1(): real;
begin
    board[user1] := 1;
    turn := turn + 1;
end;
{
    this function create a random number that is a position in the board,
    then validate if that position is valid, if not create new position
}
function insert_board_machine(): real;
begin
    user2 := random(9) + 1;
    while not valid_pos(user2) do
    begin
        user2 := random(9) + 1;
    end;
    board[user2] := 0;
    turn := turn + 1;
end;
{
    print the board with the movements made by each user
}
function print_board(): real;
begin

    writeln('==================', usermsg, '==================');
    writeln('                [', printCharacter(1), ' | ', printCharacter(2), '| ', printCharacter(3), ']');
    writeln('                [', printCharacter(4), ' | ', printCharacter(5), '| ', printCharacter(6), ']');
    writeln('                [', printCharacter(7), ' | ', printCharacter(8), '| ', printCharacter(9), ']');
    writeln('=========================================');
end;
{
    This function validate if the user1 win when make a movement
}
function valid_win_user1(): boolean;
begin
    if (board[1] = 1) AND (board[2] = 1) AND (board[3] = 1) OR
        (board[1] = 1) AND (board[4] = 1) AND (board[7] = 1) OR
        (board[1] = 1) AND (board[5] = 1) AND (board[9] = 1) OR
        (board[2] = 1) AND (board[5] = 1) AND (board[8] = 1) OR
        (board[3] = 1) AND (board[5] = 1) AND (board[7] = 1) OR
        (board[3] = 1) AND (board[6] = 1) AND (board[9] = 1) OR
        (board[4] = 1) AND (board[5] = 1) AND (board[6] = 1) OR
        (board[7] = 1) AND (board[8] = 1) AND (board[9] = 1) Then
    begin
        message := '¡User1 Win!';
        endprocess := false;
        valid_win_user1 := true;
    end
    else
    begin
        valid_win_user1 := false;
    end;
end;
{
    This function validate if the machine win when make a movement
}
function valid_win_user2(): boolean;
begin
    if (board[1] = 0) AND (board[2] = 0) AND (board[3] = 0) OR
        (board[1] = 0) AND (board[4] = 0) AND (board[7] = 0) OR
        (board[1] = 0) AND (board[5] = 0) AND (board[9] = 0) OR
        (board[2] = 0) AND (board[5] = 0) AND (board[8] = 0) OR
        (board[3] = 0) AND (board[5] = 0) AND (board[7] = 0) OR
        (board[3] = 0) AND (board[6] = 0) AND (board[9] = 0) OR
        (board[4] = 0) AND (board[5] = 0) AND (board[6] = 0) OR
        (board[7] = 0) AND (board[8] = 0) AND (board[9] = 0) Then
    begin
        message := '¡User2 Win!';
        endprocess := false;
        valid_win_user2 := true;
    end
    else
    begin
        valid_win_user2 := false;
    end;
end;
{
    All the logical
}
begin
    {
        print all the rules and how it works
    }
    writeln ('==================Guide==================');
    writeln ('                [1 | 2| 3]                ');
    writeln ('                [4 | 5| 6]                ');
    writeln ('                [7 | 8| 9]                ');
    writeln ('-----------------------------------------');
    writeln ('0: is the IA and represent the "O"');
    writeln ('1: is the User1 and represent the "X"');    
    writeln ('-----------------------------------------');
    writeln ('You need to insert numbers between 1-9');
    writeln ('=========================================');
    {
        initialize the board, and the status program
    }
    start_board();
    user1 := 0;
    user2 := 0;
    turn := 0;
    endprocess := true;
    {
        main loop
    }
    while endprocess do
    begin
        {
            user 1 insert a value
        }
        writeln('Insert position');
        readln (user1);
        {
            validate if that position inserted is valid
        }
        if (user1 > 0) AND (user1 < 10) Then
        begin
            {
                if the position is empty
            }
            if valid_pos(user1) Then
            begin
                {
                    insert into the board
                    print the movement
                    validate if that movement is the win or if is the last movement
                }
                insert_board_user1();
                usermsg := 'USER1';
                print_board();
                if valid_win_user1() OR (turn = 9) Then
                begin
                    if turn = 9 Then
                    begin
                        message := '¡Match draw!';
                    end;
                    break;
                end;
                {
                    insert into the board
                    print the movement
                    validate if that movement is the win or if is the last movement
                }
                usermsg := 'USER2';
                insert_board_machine();
                print_board();
                if valid_win_user2() OR (turn = 9) Then
                begin
                    if turn = 9 Then
                    begin
                        message := '¡Match draw!';
                    end;
                    break;
                end;
            end
            else
            begin
                writeln('That position is occupied, insert other...');
                continue;
            end;
        end
        else
        begin
            writeln('Type a number between 1 and 9');
        end;
    end;
    writeln(message);
end.
