unit UTefInputBoxCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFTefInputBoxCheque = class(TForm)
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    btVoltar: TBitBtn;
    gbCheque: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MEComp: TMaskEdit;
    MEBanco: TMaskEdit;
    MEAg: TMaskEdit;
    MEC1: TMaskEdit;
    MECC: TMaskEdit;
    MEC2: TMaskEdit;
    Label7: TLabel;
    MENumCheque: TMaskEdit;
    Label8: TLabel;
    MEC3: TMaskEdit;
    procedure BtOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure LimpaCampos;
    procedure MEC3KeyPress(Sender: TObject; var Key: Char);
  private
    FInfoCheque: String;
  public
    property InfoCheque: String read FInfoCheque write FInfoCheque;
  end;

var
  FTefInputBoxCheque: TFTefInputBoxCheque;

implementation

uses UBiblioteca;

{$R *.dfm}

procedure TFTefInputBoxCheque.BtOkClick(Sender: TObject);
begin
  FInfoCheque :=  '0:' + bib.strzero(trim(MEComp.Text), 3) + bib.strzero(trim(MEBanco.Text), 3)
    + bib.strzero(trim(MEAg.Text), 4) + bib.strzero(trim(MEC1.Text), 1) + bib.strzero(trim(MECC.Text), 10)
      + bib.strzero(trim(MEC2.Text), 1) + bib.strzero(trim(MENumCheque.Text), 6) + bib.strzero(trim(MEC3.Text), 1);
  ShowMessage(FInfoCheque);
  ModalResult := mrOk;
end;

procedure TFTefInputBoxCheque.FormActivate(Sender: TObject);
begin
  LimpaCampos;
  MEComp.SetFocus;
end;

procedure TFTefInputBoxCheque.LimpaCampos;
begin
  MEComp.Text := '';
  MEBanco.Text:= '';
  MEAg.Text:= '';
  MEC1.Text:= '';
  MECC.Text:= '';
  MEC2.Text:= '';
  MENumCheque.Text:= '';
  MEC3.Text:= '';
end;

procedure TFTefInputBoxCheque.MEC3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    BtOk.Click;
  end;
end;

end.
