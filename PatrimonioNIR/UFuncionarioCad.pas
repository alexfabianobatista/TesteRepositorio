unit UFuncionarioCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, Buttons, DBCtrls, ImgList, Db, Menus, ComCtrls,
  Mask, ExtCtrls;

type
  TFFuncionarioCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    BtConsCategoria: TBitBtn;
    RelaodeFuncionrios1: TMenuItem;
    procedure BtConsCategoriaClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodeFuncionrios1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFuncionarioCad: TFFuncionarioCad;

implementation

uses UFuncionario_cl, UCategoriaCons, UCategoriaProfissional_cl,
  UFFuncionarioCons, UrFuncionario;

{$R *.DFM}

procedure TFFuncionarioCad.BtConsCategoriaClick(Sender: TObject);
begin
  inherited;
  If FCategoriaCons = Nil then
    FCategoriaCons := TFCategoriaCons.Create(Application);
  If FCategoriaCons.showModal = mrOk then
    DMFuncionario.QFuncionarioCod_Categoria.Value := DMCategoriaProfissional.QCategoriaConsCod_Categoria.Value;

end;

procedure TFFuncionarioCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DSInsert,DSEdit] then
    begin
      BtConsCategoria.Enabled:=True;
    end
  Else
    begin
      BtConsCategoria.Enabled:=False;
    end;


end;

procedure TFFuncionarioCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DmFuncionario do
  Begin
    QFuncionario.Close;
    QFuncionario.Open;
  End;

end;

procedure TFFuncionarioCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DmFuncionario do
    QFuncionario.Close;
  Action := CaFree;
  FFuncionarioCad := Nil;
end;

procedure TFFuncionarioCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FFuncionarioCons = Nil then
    FFuncionarioCons := TFFuncionarioCons.Create(Application);
  If FFuncionarioCons.ShowModal = mrOk then
  With DMFuncionario do
  Begin
    QFuncionario.Close;
    QFuncionario.SetVariable('PK',QFuncionarioConsCod_Funcionario.Value);
    QFuncionario.Open;
  End;
end;

procedure TFFuncionarioCad.RelaodeFuncionrios1Click(Sender: TObject);
begin
  inherited;
  with DMFuncionario do
  begin
    QRFuncionario.Close;
    QRFuncionario.Open;

    if FRFuncionario = Nil then
      FRFuncionario := TFRFuncionario.Create(Application);
    FRFuncionario.QRPrimario.Preview;
    QRfuncionario.Close;
  End;
end;

end.
