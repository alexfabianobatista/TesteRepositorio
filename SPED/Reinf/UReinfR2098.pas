unit UReinfR2098;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, Grids, DBGrids, UFmFilial, UBibSped, UFilial_cl,
  UUsuario_cl, UOracle_cl, DBCtrls, UGeraXMLReinf;

type
  TFReinfR2098 = class(TFTCadSimples)
    Panel2: TPanel;
    FmFilialR2098: TFmFilial;
    DBGReinfR2098: TDBGrid;
    dtpkDataReferencia: TDateTimePicker;
    DBECodigo: TDBEdit;
    Label1: TLabel;
    btnGerarEvento: TButton;
    procedure AtivarDesativarCampos(Botao: TButton);
    procedure FormCreate(Sender: TObject);
    procedure IniciaDadosTela;
    procedure LimparCampos;
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGReinfR2098CellClick(Column: TColumn);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure btnGerarEventoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FReinfR2098: TFReinfR2098;
  BibSped: TBibSped;

implementation

uses UReinf_cl;

{$R *.dfm}

procedure TFReinfR2098.AtivarDesativarCampos(Botao: TButton);
var
  isAtivo: boolean;
begin

  isAtivo := (DSPrimario.State in [dsEdit, dsInsert]);

  dtpkDataReferencia.Enabled := isAtivo;
  FmFilialR2098.MeFilial.Enabled := isAtivo;
  FmFilialR2098.EdFilial.Enabled := isAtivo;
  DBECodigo.Enabled := isAtivo;

end;

procedure TFReinfR2098.FormCreate(Sender: TObject);
begin

  AtivarDesativarCampos(TButton(SBCancelar));
  IniciaDadosTela;

end;

procedure TFReinfR2098.IniciaDadosTela;
var
  wHoje, wInicioMes, wFimMes: TDate;
begin
  inherited;

  if BibSped = nil then
    BibSped := tBibSped.Create;

  with DMReinf do
  begin
    if QReinfR2098.State in [dsBrowse] then
    begin
      QReinfR2098.First;
      QReinfR2098Cons.First;
    end
    else
    begin
      QReinfR2098.Open;
      QReinfR2098Cons.Open;
    end;

    wHoje := Now;

    if QReinfR2098.IsEmpty then
      dtpkDataReferencia.Date :=  BibSped.GetStartOfPreviousMonth(wHoje)
    else
      dtpkDataReferencia.Date :=  QReinfR2098DT_PERIODO_APURACAO.Value;
    FmFilialR2098.MeFilial.Text := QReinfR2098COD_FILIAL.Text;
    FmFilialR2098.MeFilialExit(Self);

  end;

end;

procedure TFReinfR2098.LimparCampos;
begin

  FmFilialR2098.EdFilial.Clear;
  FmFilialR2098.MeFilial.Clear;
  IniciaDadosTela;

end;

procedure TFReinfR2098.SBConfirmarClick(Sender: TObject);
begin
  with DMReinf do
  begin

    QReinfR2098IND_RETIFCACAO.Value := 0;
    QReinfR2098COD_FILIAL.Value := StrToInt(Trim(FmFilialR2098.MeFilial.Text));
    QReinfR2098DT_PERIODO_APURACAO.Value := dtpkDataReferencia.Date;
    QReinfR2098IND_PRODUCAO_HOMOLOGACAO.Value := DMFilial.QFilialIND_AMBIENTE_REINF.Value;
    QReinfR2098IND_TIPO_APLICATIVO.Value := 1;
    QReinfR2098COD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;

  end;    
  inherited;
  AtivarDesativarCampos(TButton(SBConfirmar));
  DBGReinfR2098.DataSource.DataSet.Refresh;

end;

procedure TFReinfR2098.SBIncluirClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
  AtivarDesativarCampos(TButton(Sender));
  dtpkDataReferencia.Date :=  BibSped.GetStartOfPreviousMonth(now);
end;

procedure TFReinfR2098.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with DMReinf do
  begin
    QReinfR2098.Close;
    QReinfR2098Cons.Close;
  end;

  inherited;
end;

procedure TFReinfR2098.DBGReinfR2098CellClick(Column: TColumn);
begin

  with DMReinf do
  begin
    if (QReinfR2098.State in [dsBrowse]) and (QReinfR2098.RecordCount > 0) then
    begin
      QReinfR2098.Close;
      QReinfR2098.SetVariable('PK', DBGReinfR2098.DataSource.DataSet.FieldByName('COD_REINF_R2098').Value);
      QReinfR2098.Open;

      FmFilialR2098.MeFilial.Text := QReinfR2098COD_FILIAL.Text;
      FmFilialR2098.MeFilialExit(Self);

      dtpkDataReferencia.DateTime := QReinfR2098DT_PERIODO_APURACAO.AsDateTime;
    end;
  end;
  inherited;
  AtivarDesativarCampos(TButton(SBConfirmar));

end;

procedure TFReinfR2098.SBAlterarClick(Sender: TObject);
begin
  inherited;
  AtivarDesativarCampos(TButton(SBAlterar));

end;

procedure TFReinfR2098.SBExcluirClick(Sender: TObject);
begin
  with DMOracle, DMReinf do
  begin
    if Dialogs.MessageDlg('Isso excluirá todas as informações. Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if (GeraXml.ValidaEventoReinf(QReinfR2098COD_REINF_R2098.Value, 'R-2098')) then
      begin
        inherited;
        LimparCampos;
        AtivarDesativarCampos(TButton(Sender));
      end
      else
        Raise Exception.Create('Já existe evento gerado para envio. Exclua os eventos não enviados para poder alterá-los.');
    end
    else
      ShowMessage('Cancelado pelo usuário!');
  end;
  DBGReinfR2098.DataSource.DataSet.Refresh;

end;

procedure TFReinfR2098.SBCancelarClick(Sender: TObject);
begin

  LimparCampos;
  inherited;
  AtivarDesativarCampos(TButton(SBCancelar));
end;

procedure TFReinfR2098.btnGerarEventoClick(Sender: TObject);
var
  GeraXML: TGeraXMLReinf;
begin
  inherited;
  if GeraXML = nil then
    GeraXML := TGeraXMLReinf.Create;

  with DMReinf, DMOracle do
  begin

    // verifica se a query do evento está aberta
    if not (QReinfR2098.State in [dsBrowse]) then
      raise Exception.Create('Não foi possível realizar a geração. O registro deve estar salvo!')
    else
    begin
      if (BuscaNome('SELECT COUNT(COD_REINF_PERIODO) FROM TB_REINF_PERIODO', 'DESC_EVENTO_REINF = ' +
                  QuotedStr('R-2098') +  ' AND COD_EVENTO_REINF = ' + QReinfR2098COD_REINF_R2098.Text) = '0') then
      begin
        // verifica se o evento está selecionado
        if Trim(QReinfR2098COD_REINF_R2098.Text) = '' then
          raise Exception.Create('Deve haver um registro selecionado para geração.')
        else
          GeraXML.GerarR2098(QReinfR2098COD_REINF_R2098.Value, 'R-2098', '1.05.01');
      end
      else
        raise Exception.Create('Este evento já foi gerado!');
    end;
  end;

end;

end.
