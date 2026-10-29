unit UPragaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, DBDirceu, ActnList, DBPanel, StrUtils,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFPragaCad = class(TFTCadSimples)
    RelatriodePragas1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBNavigator1: TDBNavigator;
    Label3: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit10: TDBEdit;
    BTConsProduto: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    BitBtn2: TBitBtn;
    Label11: TLabel;
    Label12: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    PragaporProduto1: TMenuItem;
    ProdutoPorPraga1: TMenuItem;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    BitBtn1: TBitBtn;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    CulturaPragaProduto1: TMenuItem;
    Opes1: TMenuItem;
    Exportarreceiturioevendas1: TMenuItem;
    SDReceituarioVendas: TSaveDialog;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPUnidadeDosagem: TDBPanel;
    Label9: TLabel;
    DBEdit12: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatriodePragas1Click(Sender: TObject);
    procedure BTConsProdutoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure PragaporProduto1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ProdutoPorPraga1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CulturaPragaProduto1Click(Sender: TObject);
    procedure Exportarreceiturioevendas1Click(Sender: TObject);
    procedure DBPUnidadeDosagemDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPragaCad: TFPragaCad;

implementation

uses UPraga_cl, UPragaCons, URPraga, UProdutoCons, UMensReceitaCons,
  UProduto_cl, UMensReceita_cl, URPragaProduto, UrProdutoPraga,
  UCulturaCons, UCultura_cl, URCulturaPragaProduto, UPragaParam,
  UBiblioteca, UOracle_cl, UReceituarioVendas, UUnidadeDosagemCons,
  UBibAgricola;

{$R *.DFM}

procedure TFPragaCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMPraga do
    QPraga.Open;
end;

procedure TFPragaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPragaCons = nil then
     FPragaCons := TFPragaCons.Create(Application);
  If FPragaCons.ShowModal = mrOK then
     with DMPraga do
     begin
        QPraga.Close;
        QPragaProduto.Close;
        QPraga.SetVariable('PK',QPragaConsCod_Praga.Value);
        QPraga.Open;
        QPragaProduto.Open;
     end;

end;

procedure TFPragaCad.RelatriodePragas1Click(Sender: TObject);
begin
  inherited;
  with DmPraga do
  begin
    QPragaCons.Close;
    QPragaCons.Open;
    If FRPraga = Nil then
       FRPraga := TFRPraga.Create(Application);
    FRPraga.QRPrimario.Preview;
    QPragaCons.Close;
  end;
end;

procedure TFPragaCad.BTConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
     DMPraga.QPragaProdutoCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
end;

procedure TFPragaCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FMensReceitaCons = nil then
     FMensReceitaCons := TFMensReceitaCons.Create(Application);
  If FMensReceitaCons.ShowModal = mrOK then
     DMPraga.QPragaProdutoCod_Mens_Receita.Value := DMMensReceita.QMensReceitaConsCod_Mens_Receita.Value;
end;

procedure TFPragaCad.PragaporProduto1Click(Sender: TObject);
begin
  inherited;
  with DmPraga do
  begin
    QRPragaProduto.Close;
    QRPragaProduto.Open;
    If FRPragaProduto = Nil then
       FRPragaProduto := TFRPragaProduto.Create(Application);
    FRPragaProduto.QRPrimario.Preview;
    QRPragaProduto.Close;
  end;
end;

procedure TFPragaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (20);
end;

procedure TFPragaCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  With DMPraga do
    QPraga.Close;
  Action := CaFree;
  FPragaCad := Nil;
end;

procedure TFPragaCad.ProdutoPorPraga1Click(Sender: TObject);
begin
  inherited;
  with DmPraga do
  begin
    QRProdutoPraga.Close;
    QRProdutoPraga.Open;
    If FRProdutoPraga = Nil then
       FRProdutoPraga := TFRProdutoPraga.Create(Application);
    FRProdutoPraga.QRPrimario.Preview;
    QRProdutoPraga.Close;
  end;

end;

procedure TFPragaCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FCulturaCons = nil then
     FCulturaCons := TFCulturaCons.Create(Application);
  If FCulturaCons.ShowModal = MrOK then
     DMPraga.QPragaProdutoCod_Cultura.Value := DMCultura.QCulturaConsCod_Cultura.Value;
end;

procedure TFPragaCad.CulturaPragaProduto1Click(Sender: TObject);
begin
  inherited;
  with DmPraga do
  begin
    QRCulturaPragaProduto.Close;
    QRCulturaPragaProduto.Open;
    If FRCulturaPragaProduto = Nil then
       FRCulturaPragaProduto := TFRCulturaPragaProduto.Create(Application);
    FRCulturaPragaProduto.QRPrimario.Preview;
    QRCulturaPragaProduto.Close;
  end;
end;

procedure TFPragaCad.Exportarreceiturioevendas1Click(Sender: TObject);
  procedure AdicionaItem(var Onde: String; OQue: String);
  begin
    Onde := Onde + OQue + ';';
  end;
  procedure AdicionaItemInt(var Onde: String; OQue: Integer);
  begin
    AdicionaItem(Onde, IntToStr(OQue));
  end;
  procedure AdicionaItemDate(var Onde: String; OQue: TDateTime);
  begin
    AdicionaItem(Onde, FormatDateTime('dd/MM/yyyy', OQue));
  end;
  function LimpaLinha(Msg: String): String;
  begin
    Result := StringReplace(Msg, #$D + #$A, ' ', [rfReplaceAll]);
  end;
var
  Str: TStrings;
  Linha, Aux: String;
  NumReceita, i, j: Integer;
  Receita: TReceituario;
  ReceitaItem: TReceituarioItem;
  Receitas: array of TReceituario;
  bibAgricola: TBibAgricola;
begin
  inherited;
  if FPragaParam = nil then
    FPragaParam := TFPragaParam.Create(Application);
  FPragaParam.AtivaPagina(0);
  if FPragaParam.ShowModal = MrOk then
    with DMPraga do
    begin
      if Trim(FPragaParam.Fm0Filial.MeFilial.Text) = '' then
        Raise Exception.Create('Obrigatório informar filial.');
      if Trim(FPragaParam.Fm0Data.MeDtInicial.Text) = '' then
        Raise Exception.Create('Obrigatório informar datas.');
      if Trim(FPragaParam.Fm0Data.MeDtFinal.Text) = '' then
        Raise Exception.Create('Obrigatório informar datas.');
      QRReceituario.Close;
      QRReceituario.SetVariable('FILIAL', Trim(FPragaParam.Fm0Filial.MeFilial.Text));
      QRReceituario.SetVariable('DT_INICIO', FPragaParam.Fm0Data.MeDtInicial.Text);
      QRReceituario.SetVariable('DT_FIM', FPragaParam.Fm0Data.MeDtFinal.Text);
      QRReceituario.Open;

      SetLength(Receitas, 0);
      QRReceituario.First;
      while not QRReceituario.Eof do
      begin
        Receita := TReceituario.Create;
        Receita.Numero := QRReceituarioNUM_RECEITA.Value;
        Receita.CpfAgronomo := Bib.LimpaNumero(QRReceituarioCPF_AGRONOMO.Text);
        Receita.NomeUsuario := QRReceituarioNOME_CADASTRO.Value;
        Receita.CpfUsuario := Bib.LimpaNumero(QRReceituarioCGC_CPF_CADASTRO.Text);
        Receita.LocalPropriedade := QRReceituarioDESC_ENDERECO.Value;
        Receita.Municipio := StrToInt(QRReceituarioCOD_UF_IBGE.Text + QRReceituarioCOD_CIDADE_IBGE.Text);
        Receita.Cultura := QRReceituarioCOD_CULTURA_SIAGRO.Value;
        Receita.Alvo := QRReceituarioCOD_PRAGA_SIAGRO.Value;
        //Receita.Diagnostico := 'A';
        Receita.Diagnostico := copy(QRReceituarioDESC_PRAGA.Value,1,100); //Renan(PLANTIAGRO) passou layout dizendo que diagnóstico é a DESC_PRAGA. Junior - 21/07/2015
        Receita.DataEmissao := QRReceituarioDT_EMISSAO.Value;
        Receita.Precaucao := QRReceituarioDESC_PRECAUCAO.Value + ' ' + QRReceituarioDESC_PRECAUCAO_MENS.Value;  //incluída precaução a pedido do Luciado Grasel - Cleber 30/05/2020
        Receita.Epi := QRReceituarioDESC_EPI.Value;
        Receita.ModalidadeEpoca := '';
        Receita.Outras := QRReceituarioDESC_OBS.Value;
        Receita.Orientacao := QRReceituarioDESC_ORIENTACAO.Value;
        Receita.NumeroAplicacoes := QRReceituarioNUM_APLICACAO.Value;
        Receita.Latitude := Bib.RetiraCaracteres(TiraLetras, Bib.RetiraCaracteres(TiraLetras, QRReceituarioDESC_LATITUDE.Value));  //Cleber 15/05/2019
        Receita.Longitude := Bib.RetiraCaracteres(TiraLetras, Bib.RetiraCaracteres(TiraLetras, QRReceituarioDESC_LONGITUDE.Value)); // Cleber 15/05/2019

        NumReceita := QRReceituarioNUM_RECEITA.Value;
        while (not QRReceituario.Eof) and (QRReceituarioNUM_RECEITA.Value = NumReceita) do
        begin
          ReceitaItem := TReceituarioItem.Create;
          ReceitaItem.NumeroReceituario := QRReceituarioNUM_RECEITA.Value;
          ReceitaItem.CpfAgronomo := Bib.LimpaNumero(QRReceituarioCPF_AGRONOMO.Value);
          ReceitaItem.Agrotoxico := QRReceituarioCOD_PRODUTO_SIAGRO.Value;
          bibAgricola := TBibAgricola.Create;
          ReceitaItem.Quantidade := bibAgricola.quantidadeReceita(QRReceituario);
          ReceitaItem.Dose := QRReceituarioNUM_DOSE.Value;
          if not QRReceituarioCOD_UNIDADE_DOSAGEM.IsNull then
            ReceitaItem.Unidade := QRReceituarioCOD_UNIDADE_DOSAGEM.Value
          else
          begin
            Aux := UpperCase(QRReceituarioDESC_AREA.Text);
            Bib.SubstituiStr(Aux, ' ', '');
            if Length(Bib.LimpaNumero(Aux)) <> Length(Aux) then
            begin
              if (Aux = 'L/HA') or (Aux = 'LT/HA') then
                ReceitaItem.Unidade := 1
              else if Aux = 'ML/KG' then
                ReceitaItem.Unidade := 2
              else if Aux = 'KG/HA' then
                ReceitaItem.Unidade := 3
              else if Aux = 'G/M' then
                ReceitaItem.Unidade := 4
              else
              begin
                ReceitaItem.Unidade := 5;
                //Para unidade de medida 5 - Outras, concatenar na modalidade a unidade de medida.
                if (Length(Receita.ModalidadeEpoca) > 0) and
                    (Receita.ModalidadeEpoca[Length(Receita.ModalidadeEpoca) - 1] <> '.') then
                  Receita.ModalidadeEpoca := Receita.ModalidadeEpoca + '.';
                Receita.ModalidadeEpoca := Trim(Receita.ModalidadeEpoca + ' ' +
                    QRReceituarioDESC_AGUA.Value);
                Receita.ModalidadeEpoca := Trim(Receita.ModalidadeEpoca + ' ' +
                    QRReceituarioDESC_DESTINO.Value);
                Receita.ModalidadeEpoca := Receita.ModalidadeEpoca + ' Agrotóxico/Produto: ' +
                     QRReceituarioDESC_PRODUTO.Value + ' - Unidade: ' + Aux + '.';
              end;
            end
            else
              ReceitaItem.Unidade := 5;
          end;
          if ReceitaItem.Dose = 0 then
          begin
            if (Length(Bib.LimpaNumero(Aux)) = Length(Aux)) and
              (StrToFloat('0' + Aux) > Receita.Area) then
                Receita.Area := StrToFloat(Aux);
          end
          else if (ReceitaItem.Quantidade / ReceitaItem.Dose) > Receita.Area then
            Receita.Area := ReceitaItem.Quantidade / ReceitaItem.Dose;

          if Length(QRReceituarioDESC_UTILIZACAO.Value) > Length(Receita.ModalidadeEpoca) then
          begin
            Aux := QRReceituarioDESC_UTILIZACAO.Value;
            Aux := Bib.LimpaString(Aux, #$D + #$A);
            Aux := Bib.SubstituiStr(Aux, ';', '.');
            Receita.ModalidadeEpoca := Aux + Receita.ModalidadeEpoca;
          end;

          if Length(QRReceituarioDESC_CARENCIA.Value) > Length(Receita.IntervaloSeguranca) then
            Receita.IntervaloSeguranca := QRReceituarioDESC_CARENCIA.Value;

          //Alvo 2324 é ADJUVANTE / ESPALHANTE, ele sempre acompanha outro alvo, e quando acompanha nao é ele que sai no receituario e, sim, o alvo acompanhado.
          if (Receita.Alvo = 2324) and (Receita.Alvo <> QRReceituarioCOD_PRAGA_SIAGRO.Value) then
            Receita.Alvo := QRReceituarioCOD_PRAGA_SIAGRO.Value;
            
          Receita.AddItem(ReceitaItem);
          QRReceituario.Next;
        end;

        SetLength(Receitas, Length(Receitas) + 1);
        Receitas[Length(Receitas) - 1] := Receita;
      end;

      Str := TStringList.Create;
      Str.Clear;
      for i := 0 to Length(Receitas) - 1 do
      begin
        Receita := Receitas[i];
        Linha := '';
        AdicionaItem(Linha, Receita.Tipo); //Tipo de registro
        AdicionaItem(Linha, IntToStr(Receita.Numero)); //Número do receituário
        AdicionaItem(Linha, Receita.CpfAgronomo); //CPF do profissional Agronomia
        AdicionaItem(Linha, Receita.Art); //ART
        AdicionaItem(Linha, Receita.NomeUsuario); //Nome do usuário do Agrotóxico
        AdicionaItem(Linha, Receita.CpfUsuario); //CPF/CNPJ do usuário do Agrotóxico
        AdicionaItem(Linha, Receita.NomePropriedade); //Nome da Propriedade
        AdicionaItem(Linha, Bib.TrocaVirgulaPorPonto(FloatToStr(Receita.Area))); //Área da Propriedade
        AdicionaItem(Linha, Receita.LocalPropriedade); //Localização da Propriedade
        AdicionaItem(Linha, IntToStr(Receita.Municipio)); //Município de Aplicação
        AdicionaItem(Linha, IfThen(Receita.Microbacia > 0, IntToStr(Receita.Microbacia))); //Código da Microbacia (Deixar em Branco)
        AdicionaItem(Linha, Receita.Latitude); //Latitude da Propriedade
        AdicionaItem(Linha, Receita.Longitude); //Longitude da Propriedade
        AdicionaItem(Linha, IntToStr(Receita.Cultura)); //Código da Cultura
        AdicionaItem(Linha, IntToStr(Receita.Alvo)); //Código do Alvo
        AdicionaItem(Linha, Receita.Diagnostico); //Diagnóstico
        AdicionaItemDate(Linha, Receita.DataEmissao); //Data de emissão (dd/mm/aaaa)
        AdicionaItem(Linha, Receita.ModalidadeEpoca); //Modalidade e epoca de aplicação
        AdicionaItem(Linha, Receita.IntervaloSeguranca); //Intervalo de Segurança
        AdicionaItem(Linha, Receita.Precaucao); //Precauções de Uso
        AdicionaItem(Linha, Receita.Orientacao); //Orientações de Manejo
        AdicionaItem(Linha, Receita.Epi); //EPI
        AdicionaItem(Linha, Receita.Outras); //Outras Informações
        AdicionaItem(Linha, IntToStr(Receita.NumeroAplicacoes)); // Numero de Aplicações
        if DMOracle.DataServ >= StrToDate('04/06/2018') then
        begin
          AdicionaItem(Linha, Receita.Hash);
          AdicionaItem(Linha, Receita.RepositorioPublico);
          AdicionaItem(Linha, Receita.TipoAssinatura);
        end;
        Linha := LimpaLinha(Linha);
        Str.Add(Linha);

        for j := 0 to Length(Receita.Items) - 1 do
        begin
          ReceitaItem := Receita.Items[j];
          Linha := '';
          AdicionaItem(Linha, ReceitaItem.Tipo); //Tipo de registro
          AdicionaItemInt(Linha, ReceitaItem.NumeroReceituario); //Número do receituário
          AdicionaItem(Linha, ReceitaItem.CpfAgronomo); //CPF do profissional Agronomia
          AdicionaItemInt(Linha, ReceitaItem.Agrotoxico); //Código do Agrotóxico/Produto
          AdicionaItem(Linha, Bib.TrocaVirgulaPorPonto(FloatToStr(ReceitaItem.Quantidade))); //Quantidade a Adquirir
          AdicionaItem(Linha, Bib.TrocaVirgulaPorPonto(FloatToStr(ReceitaItem.Dose))); //Dose
          AdicionaItemInt(Linha, ReceitaItem.Unidade); //Unidade
          Str.Add(LimpaLinha(Linha));
        end;
      end;
      if Length(Receitas) = 0 then
        MessageDlg('Não foram encontrados receituários para serem exportados.', mtInformation, [mbOK], 0)
      else
      begin
        SDReceituarioVendas.FileName := 'receita.csv';
        if SDReceituarioVendas.Execute then
          Str.SaveToFile(SDReceituarioVendas.FileName);
      end;

      QRVendas.Close;
      QRVendas.ClearVariables;
      QRVendas.SetVariable('FILIAL', FPragaParam.Fm0Filial.MeFilial.Text);
      QRVendas.SetVariable('DT_INICIO', FPragaParam.Fm0Data.MeDtInicial.Text);
      QRVendas.SetVariable('DT_FIM', FPragaParam.Fm0Data.MeDtFinal.Text);
      QRVendas.Open;

      Str.Clear;
      QRVendas.First;
      while not QRVendas.Eof do
      begin
        Linha := '';
        AdicionaItem(Linha, 'V'); //Tipo de registro
        AdicionaItem(Linha, QRVendasNUM_RECEITA.Text); //Número do receituário
        AdicionaItem(Linha, Bib.LimpaNumero(QRVendasCPF_AGRONOMO.Text)); //CPF do profissional Agronomia
        AdicionaItem(Linha, QRVendasNUM_NOTA.Text); //Número da Nota Fiscal
        AdicionaItem(Linha, QRVendasCOD_SERIE.Text); //Série da Nota Fiscal
        AdicionaItem(Linha, QRVendasCOD_ESTADO.Text); //UF da Nota Fiscal
        AdicionaItem(Linha, QRVendasDT_EMISSAO.Text); //Data da venda (dd/mm/aaaa)
        AdicionaItem(Linha, Bib.LimpaNumero(QRVendasNUM_CGC.Text)); //CNPJ do Comerciante
        AdicionaItem(Linha, Bib.TrocaVirgulaPorPonto(FormatFloat('0.00',
          StrToFloat(QRVendasQT_AGROTOXICO.Text)))); //Quantidade comercializada de agrotóxico
        Str.Add(LimpaLinha(Linha));

        QRVendas.Next;
      end;

      SDReceituarioVendas.FileName := 'venda.csv';
      if SDReceituarioVendas.Execute then
        Str.SaveToFile(SDReceituarioVendas.FileName);
    end;
end;

procedure TFPragaCad.DBPUnidadeDosagemDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FUnidadeDosagemCons;
  Classe := TFUnidadeDosagemCons;
end;

end.
