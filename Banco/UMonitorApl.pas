unit UMonitorApl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TFMonitorApl = class(TForm)
    Timer1: TTimer;
    Memo1: TMemo;
    EdInicial: TEdit;
    EdFinal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure Testa;
  public
    { Public declarations }
  end;

var
  FMonitorApl: TFMonitorApl;

implementation

uses UBancoscad;

{$R *.DFM}

procedure TFMonitorApl.Testa;
Var wCont : Integer;
begin
  Memo1.Lines.Clear;
  For wCont := 0 to Application.ComponentCount - 1 do
  Begin
    If (Application.Components[ wCont ].Name >= EdInicial.Text)
      and (Application.Components[ wCont ].Name <= EdFinal.Text) then
    Begin
      Memo1.Lines.Add( Application.Components[ wCont ].Name + ' | ' + Application.Components[ wCont ].Owner.Name );
    End;
    If Trim(Application.Components[ wCont ].Name) = '' then
    Begin   {
      Timer1.Enabled := False;
      ShowMessage( IntToStr( wCont ) + ' ' + Application.Components[ wCont ].ClassName );
      // Application.Components[ wCont ].Destroy;
      //Application.Components[ wCont ] := Nil;
      Timer1.Enabled := True;
      }
    End;
  end;
end;

procedure TFMonitorApl.Timer1Timer(Sender: TObject);
begin
  FMonitorApl.Testa;
end;

procedure TFMonitorApl.BitBtn1Click(Sender: TObject);
begin
  If FBancosCad = Nil then
    Application.CreateForm(TFBancosCad, FBancosCad);
//    FBancosCad := TFBancosCad.Create(Application);
//  DMTela.VerificaTela(pModulo,FBancosCad.Caption,FBancosCad.Name);
  FBancosCad.ShowModal;
  // FBancosCad := Nil;
end;

end.
