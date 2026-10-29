unit UServico_Terceiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, ActnList, DBPanel, Grids, DBGrids, OracleNavigator,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;
                                                                            
type
  TFOFI0017 = class(TFTCadSimples)
    PCServicoTerceiro: TPageControl;
    TSServicoTerceiro: TTabSheet;
    Label1: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    DBPOS: TDBPanel;
    DBPServico: TDBPanel;
    DBPVendedor: TDBPanel;
    DBPCadastro: TDBPanel;
    DBPValServico: TDBPanel;
    DBPNumNota: TDBPanel;
    TSServicoTerceiroComItem: TTabSheet;
    DBPNotaCab: TDBPanel;
    DBPOS2: TDBPanel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    DBPanel2: TDBPanel;
    Label3: TLabel;
    DBPVendedor2: TDBPanel;
    DBPCadastro2: TDBPanel;
    Label4: TLabel;
    DBMemo2: TDBMemo;
    DSServicoTerceiroItem: TDataSource;
    ONServicoItem: TOracleNavigator;
    Shape1: TShape;
    DBGServicoItem: TDBGrid;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    DBPProduto: TDBPanel;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    BtImportaNF: TBitBtn;
    DBPCliente: TDBPanel;
    SBBloquear: TSpeedButton;
    SBDesbloquear: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBPOSDefine(Sender: TObject; var QueryConsulta: TDataSet;
      var FormConsulta: TForm);
    procedure DBPOSCodigoChange(Sender: TObject);
    procedure DBPServicoDefine(Sender: TObject;
      var QueryConsulta: TDataSet; var FormConsulta: TForm);
    procedure DBPVendedorDefine(Sender: TObject; var QueryConsulta: TDataSet;
      var FormConsulta: TForm);
    procedure DBPCadastroDefine(Sender: TObject; var QueryConsulta: TDataSet;
      var FormConsulta: TForm);
    procedure DBPNotaCabDefine(Sender: TObject;
      var QueryConsulta: TDataSet; var FormConsulta: TForm);
    procedure FormCreate(Sender: TObject);
    function DBPNumNotaRenderizar(Sender: TObject): Boolean;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtImportaNFClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure DBPOSExit(Sender: TObject);
    procedure SBBloquearClick(Sender: TObject);
    procedure SBDesbloquearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFI0017: TFOFI0017;

implementation

uses UOficina_cl, UServicoCons, UVendedorCons, UVendedor_cl, UCadastroCons,
  UCadastro_cl, UOSCons, UServico_TerceiroCons, UOficinaParam,
  URServico_Terceiro, UProdutoCons, UProduto_cl, UParamSistema_cl,
  UOracle_cl, UBiblioteca, UNotaEntrada_cl, UNotaEntradaCons, UOs_cl,
  UServicoTerceiro_cl, USenha;

{$R *.DFM}

procedure TFOFI0017.FormActivate(Sender: TObject);
begin
  inherited;
  with DMServicoTerceiro do
  begin
    QServicoTerceiroCad.Close;
    QServicoTerceiroCad.Open;
  end;
end;

procedure TFOFI0017.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOFI0019 = nil then
    FOFI0019 := TFOFI0019.Create(Application);
  if FOFI0019.ShowModal = mrOk then
    with DMServicoTerceiro do
    begin
      QServicoTerceiroCad.Close;
      QServicoTerceiroCad.SetVariable('PK', QServicoTerceiroConsCOD_SERVICO_TERCEIRO.Value);
      QServicoTerceiroCad.Open;
    end;
end;

procedure TFOFI0017.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
//  DBPOS.Enabled := DsPrimario.State in [DsEdit, DsInsert];
//  DBPOS2.Enabled := DsPrimario.State in [DsEdit, DsInsert];
//  DBPServico.Enabled := DsPrimario.State in [DsEdit, DsInsert];
//  DBPCadastro.Enabled := DsPrimario.State in [DsEdit, DsInsert];
//  DBPCadastro2.Enabled := DsPrimario.State in [DsEdit, DsInsert];
//  DBPVendedor.Enabled := DsPrimario.State in [DsEdit, DsInsert];
//  DBPVendedor2.Enabled := DsPrimario.State in [DsEdit, DsInsert];
//  DBPNotaCab.Enabled := DsPrimario.State in [DsEdit, DsInsert];
//  DBPProduto.Enabled := DsPrimario.State in [DsEdit, DsInsert];
  BtImportaNF.Enabled := DsPrimario.State in [DsEdit, DsInsert];
end;

procedure TFOFI0017.DBPOSDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FOsCons = nil then
    FOsCons := TFOsCons.Create(Application);
  FormConsulta := FOsCons;
  QueryConsulta := DMOs.QOSCons;
end;

procedure TFOFI0017.DBPOSCodigoChange(Sender: TObject);
var wCodCLiente : String;
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS') and
      (DMServicoTerceiro.QServicoTerceiroCadNUM_OS.Value > 0) and
      (DMOracle.FastSelect('NUM_OS', 'TB_OS', 'NUM_OS = ' + DMServicoTerceiro.QServicoTerceiroCadNUM_OS.Text) = '') then
    begin
      DMServicoTerceiro.QServicoTerceiroCadNUM_OS.Value := 0;
      DBPOS.SetFocus;
    end;

  // Aparecer Nome do Cliente da OS, ao invés do NUM_CHASSI
  // Djeison - 18/06/2013
  with DMServicoTerceiro do
  begin
    if Trim(QServicoTerceiroCadNUM_OS.Text) <> '' then
    begin
      wCodCLiente :=
        DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_OS', 'NUM_OS = ' + QServicoTerceiroCadNUM_OS.Text);
      if Trim(wCodCLiente) <> '' then
        QServicoTerceiroCadnome_cliente.Text :=
          DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + wCodCliente)
      else
        QServicoTerceiroCadnome_cliente.Text := '';
    end
  end;
end;

procedure TFOFI0017.DBPServicoDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  FormConsulta := FProdutoCons;
  QueryConsulta := DMProduto.QProdutoCons;
end;

procedure TFOFI0017.DBPVendedorDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  FormConsulta := FVendedorCons;
  QueryConsulta := DMVendedor.QVendedorCons;
end;

procedure TFOFI0017.DBPCadastroDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  FormConsulta := FCadastroCons;
  QueryConsulta := DMCadastro.QCadastroCons;
end;

procedure TFOFI0017.DBPNotaCabDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FNotaEntradaCons = nil then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  FormConsulta := FNotaEntradaCons;
  QueryConsulta := DMNotaEntrada.QNotaEntradaCons;
end;

procedure TFOFI0017.FormCreate(Sender: TObject);
var
  b: bool;
begin
  inherited;
  b := (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS');
  TSServicoTerceiroComItem.TabVisible := b;
  TSServicoTerceiro.TabVisible := not b;
  if b then
  begin
    PCServicoTerceiro.ActivePage := TSServicoTerceiroComItem;
    StBLongHint.SimplePanel := False;
    StBLongHint.Panels.Add.Text := StBLongHint.SimpleText;
    StBLongHint.Panels.Items[0].Width := 380;
    StBLongHint.Panels.Add.Text := '"+" - Incluir Item; "-" - Excluir/Cancelar Item';
  end
  else
    PCServicoTerceiro.ActivePage := TSServicoTerceiro;
end;

function TFOFI0017.DBPNumNotaRenderizar(Sender: TObject): Boolean;
begin
  inherited;
  Result := DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS';
end;

procedure TFOFI0017.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if DSPrimario.State in [DsEdit, DsInsert] then
    if PCServicoTerceiro.ActivePage = TSServicoTerceiroComItem then
    begin
      if Key = '+' then
      begin
        if DSServicoTerceiroItem.State = DsInsert then
          DMServicoTerceiro.QServicoTerceiroItem.Post;
        DMServicoTerceiro.QServicoTerceiroItem.Append;
      end
      else if Key = '-' then
      begin
        if DSServicoTerceiroItem.State in [DsInsert, DsEdit] then
          DMServicoTerceiro.QServicoTerceiroItem.Cancel
        else
          DMServicoTerceiro.QServicoTerceiroItem.Delete;
      end;
    end;
end;

procedure TFOFI0017.BtImportaNFClick(Sender: TObject);
begin
  inherited;
  DMServicoTerceiro.ImportaItensNF;
end;

procedure TFOFI0017.SBConfirmarClick(Sender: TObject);
begin
//  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
//    with DMNotaEntrada do
//    begin
//      if DMServicoTerceiro.QServicoTerceiroCadCOD_NOTA_CAB.IsNull then
//        raise Exception.Create('Por favor, informe a nota de entrada do Serviço.');
//      if DMOracle.FastSelect('IND_SITUACAO', 'TB_NOTA_CAB',
//        'COD_NOTA_CAB = ' + DMServicoTerceiro.QServicoTerceiroCadCOD_NOTA_CAB.Text) <> '2' then
//        raise Exception.Create('Essa Nota ainda não foi confirmada.');
//
//      DMParamSistema.QParamSistema.RefreshRecord;
//
//      QNotaEntrada.Close;
//      QNotaEntrada.SetVariable('PK', DMServicoTerceiro.QServicoTerceiroCadCOD_NOTA_CAB.Value);
//      QNotaEntrada.Open;
//
//      if (DMServicoTerceiro.QServicoTerceiroCadVAL_SERVICO.Value < (QSomaItemNotasval_total_nota.Value +
//        (QSomaItemNotasval_total_nota.Value * DMParamSistema.QParamSistemaPERC_SERVICO_TERCEIRO.Value / 100))) then
//        raise Exception.Create('Valor cobrado pelo serviço é inferior ao permitido.');
//
//      QNotaEntrada.Close;
//    end;
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFOFI0017.SBCancelarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.RollBack;
  SBRefreshClick(Sender);
end;

procedure TFOFI0017.SBExcluirClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFOFI0017.DBPOSExit(Sender: TObject);
begin
  inherited;
  if (DMOracle.BuscaNome('SELECT IND_LIBERADA FROM TB_OS', 'NUM_OS = ' + DMServicoTerceiro.QServicoTerceiroCadNUM_OS.Text) = 'N') then
  begin
    DBPOS.SetFocus;
    ShowMessage('OS Bloqueada.');
  end;
  {begin
    if FSenha = nil then
    FSenha := TFSenha.Create(Application);
    if FSenha.ShowModal = MrOk then
    begin
      if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
      begin
        DMServicoTerceiro.QServicoTerceiroCadNUM_OS.Text := '';
        DBPOS.SetFocus;
        raise Exception.Create('Senha Inválida. OS Bloqueada! Consulte a Gerência.');
      end;
    end
    else if FSenha.ShowModal = MrCancel then
      DBPOS.SetFocus;
  end;}
end;

procedure TFOFI0017.SBBloquearClick(Sender: TObject);
begin
  inherited;
  if (DMOracle.FastSelect('IND_LIBERADA','TB_OS','NUM_OS = ' + DMServicoTerceiro.QServicoTerceiroCadNUM_OS.Text) = 'N') then
    raise Exception.Create('OS já esta bloqueada.')
  else
  begin
    if ((DMServicoTerceiro.QServicoTerceiroCadNUM_OS.Text <> '') and (DMServicoTerceiro.QServicoTerceiroCadNUM_OS.Value > 0)) then
    begin
      dmoracle.ExecutaSql('UPDATE TB_OS SET IND_LIBERADA =' + QuotedStr('N') + 'WHERE NUM_OS = ' + DMServicoTerceiro.QServicoTerceiroCadNUM_OS.Text);
      ShowMessage('OS Bloqueada.');
    end;
  end;
end;

procedure TFOFI0017.SBDesbloquearClick(Sender: TObject);
begin
  inherited;
  if ((DMServicoTerceiro.QServicoTerceiroCadNUM_OS.Text <> '') and (DMServicoTerceiro.QServicoTerceiroCadNUM_OS.Value > 0)) then
    if (DMOracle.FastSelect('IND_LIBERADA','TB_OS','NUM_OS = ' + DMServicoTerceiro.QServicoTerceiroCadNUM_OS.Text) = 'S') then
      raise Exception.Create('OS já esta Liberada.')
    else
    begin
    if FSenha = nil then
      FSenha := TFSenha.Create(Application);
    if FSenha.ShowModal = MrOk then
    begin
      if UpperCase(Trim(FSenha.EdSenha.Text)) = UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
      begin
        dmoracle.ExecutaSql('UPDATE TB_OS SET IND_LIBERADA =' + QuotedStr('S') + 'WHERE NUM_OS = ' + DMServicoTerceiro.QServicoTerceiroCadNUM_OS.Text);
        ShowMessage('OS Liberada.');
      end
      Else
        raise Exception.Create('Senha Inválida');
    end
    else
      Abort;
    end;
  end;
end.

