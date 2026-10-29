unit UBaixaCPR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, Db;

type
  TFBaixa_CPR = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaixa_CPR: TFBaixa_CPR;

implementation

uses UOracle_cl, UContratoCPR, UContratoCPR_cl;

{$R *.DFM}

procedure TFBaixa_CPR.BitBtn1Click(Sender: TObject);
begin
  If DMContrato_CPR.QContrato_CPRIND_SITUACAO.Value = 'ABERTO' Then
  Begin
    if (DBEdit1.Text = '') or (DBEdit2.Text = '') or (DBEdit3.Text = '') then
       Raise Exception.Create('É preciso preencher todos os campos!');
      DMContrato_CPR.QContrato_CPRDT_REGISTRO.Value := StrToDate(FBaixa_CPR.DBEdit1.Text);
      DMContrato_CPR.QContrato_CPRNUM_REGISTRO_IMOVEL.Value := FBaixa_CPR.DBEdit2.Text;
      DMContrato_CPR.QContrato_CPRNUM_LIVRO_REGISTRO.Value := FBaixa_CPR.DBEdit3.Text;
      DMContrato_CPR.QContrato_CPRIND_SITUACAO.Value := 'FECHADO';
      DMContrato_CPR.QContrato_CPR.Post;
  end; 
end;

procedure TFBaixa_CPR.FormActivate(Sender: TObject);
begin
  If DMContrato_CPR.QContrato_CPRIND_SITUACAO.Value = 'FECHADO' Then
  Begin
    DBEdit1.ReadOnly := True;
    DBEdit2.ReadOnly := True;
    DBEdit3.ReadOnly := True;
  end;
end;

procedure TFBaixa_CPR.BitBtn2Click(Sender: TObject);
begin
  DataSource.DataSet.Cancel;
end;

end.
