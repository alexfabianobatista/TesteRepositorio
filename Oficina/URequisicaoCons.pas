unit URequisicaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, variants, Menus;

type
  TFOFI0016 = class(TFTConsulta)
    Label3: TLabel;
    EdNumFabricante: TEdit;
    DSEstoqueAtual: TDataSource;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    MECodFilial: TMaskEdit;
    DBGRequisicao: TDBGrid;
    DSRequisicaoCons: TDataSource;
    SBOSCons: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBOSConsClick(Sender: TObject);
    procedure METextoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGRequisicaoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFI0016: TFOFI0016;

implementation

uses UOficina_cl, UProdutoCons, UOracle_cl, UProduto_cl, UOSCons,
  UParamSistema_cl, UOs_cl;

{$R *.DFM}

procedure TFOFI0016.FormActivate(Sender: TObject);
var
  i: integer;
  b: bool;
begin
  inherited;
  MECodFilial.Text:= '1';
  b := (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS');
  DBGRequisicao.TabStop := b;
  if b then
    for i := 0 to DBGrid1.Columns.Count - 1 do
      if DBGrid1.Columns.Items[i].FieldName = 'DESC_PRODUTO' then
      begin
        DBGrid1.Columns.Items[i].FieldName := 'DESC_REQUISICAO_ITEM';
        Break;
      end;
end;

procedure TFOFI0016.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QRequisicaoItensCons.Close;

    if Trim(METexto.Text) = '' then    // Numero O.S.
       QRequisicaoItensCons.SetVariable('NUM_OS',Null)
    else
       QRequisicaoItensCons.SetVariable('NUM_OS',METexto.Text);

    if Trim(MECodFilial.Text) = '' then
       QRequisicaoItensCons.SetVariable('COD_FILIAL',Null)
    else
       QRequisicaoItensCons.SetVariable('COD_FILIAL',MECodFilial.Text);

    if Trim(EdNumFabricante.Text) = '' then
       QRequisicaoItensCons.SetVariable('NUM_FABRICANTE',Null)
    else
       QRequisicaoItensCons.SetVariable('NUM_FABRICANTE',EdNumFabricante.Text);

    QRequisicaoItensCons.Open;
    QRequisicaoItensCons.First;

    // Traz informações referente estoque do produto.
    if Trim(EdNumFabricante.Text) <> '' then
    begin
      QOSEstoqueAtual.Close;

      if Trim(MECodFilial.Text) = '' then
         QOSEstoqueAtual.SetVariable('COD_FILIAL',1)
      else
         QOSEstoqueAtual.SetVariable('COD_FILIAL',MECodFilial.Text);

      QOSEstoqueAtual.SetVariable('NUM_FABRICANTE',EdNumFabricante.Text);

      QOSEstoqueAtual.Open;
    end;

    QRequisicaoCons.Close;
    if Trim(METexto.Text) <> '' then
       QRequisicaoCons.SetVariable('NUM_OS',METexto.Text)
    else
       QRequisicaoCons.SetVariable('NUM_OS',Null);
    if Trim(MeCodFilial.Text) <> '' then
       QRequisicaoCons.SetVariable('COD_FILIAL',MECodFilial.Text)
    else
       QRequisicaoCons.SetVariable('COD_FILIAL',Null);

    QRequisicaoCons.SetVariable('IND_SITUACAO',Null);
    QRequisicaoCons.Open;
  end;
end;

procedure TFOFI0016.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS' then
  begin
    DBEdit1.Text:= '';
    DBEdit2.Text:= '';
    DBEdit3.Text:= '';
    DBEdit4.Text:= '';
    DBEdit5.Text:= '';
  end;
end;

procedure TFOFI0016.SBOSConsClick(Sender: TObject);
begin
  inherited;
  if FOsCons = nil then
    FOsCons := TFOsCons.Create(Application);
  if FOsCons.ShowModal = mrOk then
    METexto.Text := DMOs.QOSConsNUM_OS.Text;
end;

procedure TFOFI0016.METextoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8, #13]) then
    Key := #0;
end;

procedure TFOFI0016.DBGRequisicaoDblClick(Sender: TObject);
begin
  inherited;
  ModalResult := MrOk;
end;

end.
