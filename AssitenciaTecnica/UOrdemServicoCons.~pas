unit UOrdemServicoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants,
  UFmCadastro, UFmVeiculo, Menus, UFmOperacao, UFmVendedor, DBPanel;

type
  TFOrdemServicoCons = class(TFTConsulta)
    MEDataI: TMaskEdit;
    MEDataF: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    RGOpcaoBaixa: TRadioGroup;
    FmCadastroCons: TFmCadastro;
    FmVeiculoCons: TFmVeiculo;
    Label4: TLabel;
    MEPlaca: TMaskEdit;
    EdModelo: TEdit;
    FmOperacaoCons: TFmOperacao;
    SBVeiculo: TBitBtn;
    FmTecnicoCons: TFmVendedor;
    RGSituacaoOS: TRadioGroup;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    MeCodVeiculo: TMaskEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MEPlacaExit(Sender: TObject);
    procedure SBVeiculoClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FmTecnicoConsBtVendedorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrdemServicoCons: TFOrdemServicoCons;

implementation

uses UOrdemServico_cl, UCadastroCons, UCadastro_cl, UVeiculoCons,
  UVeiculo_cl, UParamSistema_cl, UUsuario_cl, UOrdemServicoParam;

{$R *.DFM}

procedure TFOrdemServicoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMOrdemServico do
  begin
    QOrdemServicoCons.Close;
    QOrdemServicoCons.SetVariable('DATA_I',StrToDate(MEDataI.Text));
    QOrdemServicoCons.SetVariable('DATA_F',StrToDate(MEDataF.Text));
    //----------------
    If Trim(FmCadastroCons.MeCadastro.Text) = '' Then
      QOrdemServicoCons.SetVariable('CADASTRO',Null)
    Else
      QOrdemServicoCons.SetVariable('CADASTRO',Trim(FmCadastroCons.MeCadastro.Text));

    if Trim(FmVeiculoCons.MeVeiculo.Text) <> '' then
      QOrdemServicoCons.SetVariable('VEICULO', Trim(FmVeiculoCons.MeVeiculo.Text))
    else
      QOrdemServicoCons.SetVariable('VEICULO', null);

    if Trim(MEPlaca.Text) <> '-' then
      QOrdemServicoCons.SetVariable('NUM_PLACA',Trim(MEPlaca.Text))
    else
      QOrdemServicoCons.SetVariable('NUM_PLACA', null);
      
    if Trim(METexto.Text) <> '' then
      QOrdemServicoCons.SetVariable('NUMERO', Trim(METexto.Text))
    else
      QOrdemServicoCons.SetVariable('NUMERO', null);
      
    if Trim(FmOperacaoCons.MeOperacao.Text) <> '' then
      QOrdemServicoCons.SetVariable('OPERACAO', Trim(FmOperacaoCons.MeOperacao.Text))
    else
      QOrdemServicoCons.SetVariable('OPERACAO', null);
    
    if Trim(FmTecnicoCons.MeVendedor.Text) <> '' then
      QOrdemServicoCons.SetVariable('COD_TECNICO', Trim(FmTecnicoCons.MeVendedor.Text))
    else
      QOrdemServicoCons.SetVariable('COD_TECNICO', null);

    if Trim(MeCodVeiculo.Text) <> '' then
     QOrdemServicoCons.SetVariable('VEICULO', Trim(MeCodVeiculo.Text))
    else
     QOrdemServicoCons.SetVariable('VEICULO',null);
    //-----------------

    if DMParamSistema.QParamSistemaIND_COR_SITUACAO_OS.Value = 'S' then
      begin
      if (DMParamSistema.CodEmpresa = 'CENTERFRIO') then
      begin
        if RGSituacaoOS.ItemIndex = 0 then
          QOrdemServicoCons.SetVariable('IND_SITUACAO_OS', 'ABERTA');
        if RGSituacaoOS.ItemIndex = 1 then
          QOrdemServicoCons.SetVariable('IND_SITUACAO_OS', 'FECHADA');
        if RGSituacaoOS.ItemIndex = 2 then
          QOrdemServicoCons.SetVariable('IND_SITUACAO_OS', 'GARANTIA');
        if RGSituacaoOS.ItemIndex = 3 then
          QOrdemServicoCons.SetVariable('IND_SITUACAO_OS', null);
      end;
      if (DMParamSistema.CodEmpresa = 'FURGOESMED') then
      begin
        if RGSituacaoOS.ItemIndex = 0 then
          QOrdemServicoCons.SetVariable('IND_SITUACAO_OS', 'ABERTA');
        if RGSituacaoOS.ItemIndex = 1 then
          QOrdemServicoCons.SetVariable('IND_SITUACAO_OS', 'FECHADA');
        if RGSituacaoOS.ItemIndex = 2 then
          QOrdemServicoCons.SetVariable('IND_SITUACAO_OS', 'CORTESIA');
        if RGSituacaoOS.ItemIndex = 3 then
          QOrdemServicoCons.SetVariable('IND_SITUACAO_OS', null);
      end;
      if (DMParamSistema.CodEmpresa = 'GEOPRO') then
      begin
        if RGSituacaoOS.ItemIndex = 0 then
          QOrdemServicoCons.SetVariable('IND_SITUACAO_OS', 'ABERTA');
        if RGSituacaoOS.ItemIndex = 1 then
          QOrdemServicoCons.SetVariable('IND_SITUACAO_OS', 'ARQUIVADA');
        if RGSituacaoOS.ItemIndex = 2 then
          QOrdemServicoCons.SetVariable('IND_SITUACAO_OS', 'CORTESIA');
        if RGSituacaoOS.ItemIndex = 3 then
          QOrdemServicoCons.SetVariable('IND_SITUACAO_OS', 'FECHADA');
        if RGSituacaoOS.ItemIndex = 4 then
          QOrdemServicoCons.SetVariable('IND_SITUACAO_OS', 'FINALIZADA');
        if RGSituacaoOS.ItemIndex = 5 then
          QOrdemServicoCons.SetVariable('IND_SITUACAO_OS', null);
      end;
    end
    else
    begin
      if RGOpcaoBaixa.ItemIndex = 0 then
        QOrdemServicoCons.SetVariable('IND_BAIXADA', null);
      if RGOpcaoBaixa.ItemIndex = 1 then
        QOrdemServicoCons.SetVariable('IND_BAIXADA', 'NAO');
      if RGOpcaoBaixa.ItemIndex = 2 then
        QOrdemServicoCons.SetVariable('IND_BAIXADA', 'SIM');
    end;
    QOrdemServicoCons.Open;
  end;
end;

procedure TFOrdemServicoCons.FormCreate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'FURGOESMED') then
  begin
    MEDataI.Text := DateToStr(Date-180);
//    MEPlaca.EditMask := '>lll\-AC99;1;_'; Comentado pois ocorre erro ao remover a placa na consulta, devido ao novo modelo de placa. Alex 29/08/2023
  end
  else if (DMParamSistema.CodEmpresa = 'MEDSYSTEM') or (DMParamSistema.CodEmpresa = 'JOFER') or //Adicionado RRPECAS. Alex 18/10/2023
          (DMParamSistema.CodEmpresa = 'RRPECAS')   or (DMParamSistema.CodEmpresa = 'RSMECANICA') then  // solicitado por Neida para que ao abrir a consulta de O.S o prazo de consulta seja do ultimo ano
    MEDataI.Text := DateToStr(Date-365)
  else
    MEDataI.Text := DateToStr(Date-15);
  MEDataF.Text := DateToStr(Date);
end;

procedure TFOrdemServicoCons.FormActivate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'FURGOESMED') then
  begin
    DBGrid1.Columns[4].Visible := True;
  end;
  if (DMParamSistema.CodEmpresa = 'MEDSYSTEM') or (DMParamSistema.CodEmpresa = 'JOFER') or (DMParamSistema.CodEmpresa = 'RRPECAS') or
     (DMParamSistema.CodEmpresa = 'RSMECANICA') then
  begin
    DBGrid1.Columns[5].Visible := True; //KM Chegada
    DBGrid1.Columns[4].Visible := True;
    DBGrid1.Columns.Items[4].Index := 3;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRENTO' then
    METexto.SetFocus
  else
    BtProcurar.SetFocus;

  if (DMParamSistema.QParamSistemaIND_COR_SITUACAO_OS.Value = 'S') then
  begin
    Label13.Visible := false;
    Label14.Visible := false;
    Label15.Visible := false;
    Label16.Visible := false;
    RGOpcaoBaixa.Visible := false;
    RGSituacaoOS.Left := 8;
    RGSituacaoOS.Height := 41;
    RGSituacaoOS.Visible := True;
    Panel1.Visible := True;
    if (DMParamSistema.CodEmpresa <> 'GEOPRO') then
    begin
      Label7.Color := clGreen;
      Label10.Caption := 'Garantia';
    end;
    if (DMParamSistema.CodEmpresa = 'GEOPRO') then
    begin
      Label13.Visible := true;
      Label14.Visible := true;
      Label15.Visible := true;
      Label16.Visible := true;
      Panel1.Width := 260;
      RGSituacaoOS.Width := 450;
      RGSituacaoOS.Columns := 6;
      RGSituacaoOS.Items.Clear;
      RGSituacaoOS.Items.Add('Aberta');
      RGSituacaoOS.Items.Add('Arquivada');
      RGSituacaoOS.Items.Add('Cortesia');
      RGSituacaoOS.Items.Add('Fechada');
      RGSituacaoOS.Items.Add('Finalizada');
      RGSituacaoOS.Items.Add('Todas');
      RGSituacaoOS.ItemIndex := 5;
      Label11.Caption := 'Cortesia';
      Label8.Color := clMenuHighlight;
      Label14.Caption := 'Fechada';
      Label13.Color := clGray;
      Label15.Color := clGreen;
      Label16.Caption := 'Finalizada';
      MEPlaca.Visible := False;
      SBVeiculo.Visible := False;
      EdModelo.Visible := False;
      FmOperacaoCons.Visible := False;
      Label12.Visible := false;
      MeCodVeiculo.Visible := false;
    end;
  end;

  if (DMParamSistema.CodEmpresa = 'NFCE-IVO') then
    FmTecnicoCons.Label1.Caption := 'Mecânico';

  if (DMParamSistema.CodEmpresa <> 'RRPECAS') or (DMParamSistema.CodEmpresa = 'RSMECANICA') then
  begin
    DBGrid1.Columns.Items[6].Visible := false;
    DBGrid1.Columns.Items[7].Visible := false;
  end;

end;

procedure TFOrdemServicoCons.MEPlacaExit(Sender: TObject);
begin
  inherited;
  if (Trim(MePlaca.Text) <> '') and (DMParamSistema.CodEmpresa <> 'PATELI') then
  begin
    with DMVeiculo do
    begin
      QVeiculoCons.close;
      QVeiculoCons.SetVariable('NUM_PLACA',Trim(MePlaca.Text));
      QVeiculoCons.Open;
      if QVeiculoCons.RecordCount > 0 then
        EdModelo.Text := QVeiculoConsDESC_MODELO.Text
      else
      begin
        EdModelo.Clear;
        MeCodVeiculo.Clear;
      end;
    end;
  end;
//Adicionado para a Pateli, pois alguns veiculos não possuem placa. Alex - 26/01/2023 cod_suporte: 6321
  if (DMParamSistema.CodEmpresa = 'PATELI') and (MeCodVeiculo.Text = '') then
    EdModelo.Clear;
end;

procedure TFOrdemServicoCons.SBVeiculoClick(Sender: TObject);
begin
  inherited;
 if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.showModal = mrOk then
  begin
    MePlaca.Text := DMVeiculo.QVeiculoConsNUM_PLACA.Value;
    MeCodVeiculo.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
    MePlacaExit(Sender);
  end;
end;

procedure TFOrdemServicoCons.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
//Solicitado por Rosana da CenterFrio para facilitar a visualização das OS quando é realizado uma consulta. Alex 25/04/2022
  if (DMParamSistema.QParamSistemaIND_COR_SITUACAO_OS.Value = 'S') then
  begin
//alterando a cor da fonte da coluna
    with DMOrdemServico do
    begin
      if (DMParamSistema.CodEmpresa = 'CENTERFRIO') then
      begin
        if QOrdemServicoConsIND_SITUACAO_OS.Value = 'ABERTA' then
          TDBGrid(Sender).Canvas.Brush.Color := clRed;
        if QOrdemServicoConsIND_SITUACAO_OS.Value = 'FECHADA' then
          TDBGrid(Sender).Canvas.Brush.Color := clGray;
        if QOrdemServicoConsIND_SITUACAO_OS.Value = 'GARANTIA' then
          TDBGrid(Sender).Canvas.Brush.Color := clGreen;
      end;
      if (DMParamSistema.CodEmpresa = 'FURGOESMED') then
      begin
        if QOrdemServicoConsIND_SITUACAO_OS.Value = 'ABERTA' then
          TDBGrid(Sender).Canvas.Brush.Color := clRed;
        if QOrdemServicoConsIND_SITUACAO_OS.Value = 'FECHADA' then
          TDBGrid(Sender).Canvas.Brush.Color := clGray;
        if QOrdemServicoConsIND_SITUACAO_OS.Value = 'CORTESIA' then
          TDBGrid(Sender).Canvas.Brush.Color := clGreen;
      end;
      if (DMParamSistema.CodEmpresa = 'GEOPRO') then
      begin
        if QOrdemServicoConsIND_SITUACAO_OS.Value = 'ABERTA' then
          TDBGrid(Sender).Canvas.Brush.Color := clRed;
        if QOrdemServicoConsIND_SITUACAO_OS.Value = 'FECHADA' then
          TDBGrid(Sender).Canvas.Brush.Color := clGray;
        if QOrdemServicoConsIND_SITUACAO_OS.Value = 'FINALIZADA' then
          TDBGrid(Sender).Canvas.Brush.Color := clGreen;
        if QOrdemServicoConsIND_SITUACAO_OS.Value = 'ARQUIVADA' then
          TDBGrid(Sender).Canvas.Brush.Color := clSkyBlue;
        if QOrdemServicoConsIND_SITUACAO_OS.Value = 'CORTESIA' then
          TDBGrid(Sender).Canvas.Brush.Color := clMenuHighlight;
      end;
    end;
//atualizando a visualização do DBGrid
   DBGrid1.Canvas.FillRect(Rect);
   TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
 end;

procedure TFOrdemServicoCons.FmTecnicoConsBtVendedorClick(Sender: TObject);
begin
  inherited;
  FmTecnicoCons.BtVendedorClick(Sender);

end;

end.
